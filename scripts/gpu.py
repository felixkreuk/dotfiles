from rich.console import Console
from rich.table import Table
from concurrent.futures import ProcessPoolExecutor
import subprocess

gpustat = "$HOME/bin/gpustat"

def get_status(node):
    _, out = subprocess.getstatusoutput(f"ssh {node} '{gpustat}'")
    out = out.split("\n")
    out = list(filter(lambda x: x.startswith("["), out))
    gpus = len(out)
    active_gpus = [x.split("|")[2].split("/")[0].strip() for x in out]
    active_gpus = len([x for x in active_gpus if x != "0"])
    users = set([x.split("|")[-1].split("(")[0].strip() for x in out])
    users = filter(lambda x: x != "", users)
    return node, f"{active_gpus}/{gpus}", ",".join(users)

if __name__ == "__main__":
    console = Console()
    table = Table(show_header=True, header_style="bold red")
    table.add_column("Node")
    table.add_column("GPUs")
    table.add_column("Users")
    nodes = ['yavin','yoda','jabba','lobot','moraband','mustafar', 'naboo', 'tatooine', 'jakku', 'fondor']
    pending = []
    with ProcessPoolExecutor(len(nodes)) as pool:
        for node in nodes:
            pending.append(pool.submit(get_status, node))
    for res in pending:
        node, gpus, users = res.result()
        if gpus[0] == "0":
            node = "[bold green]" + node
        elif "felixk" in users:
            node = "[bold blue]" + node
        table.add_row(node, gpus, users)
    console.print(table)
