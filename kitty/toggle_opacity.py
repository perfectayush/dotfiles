# Using kitty terminal API write a function to toggle transparency of the terminal
from typing import Any, Dict, List

from kittens.tui.handler import result_handler
from kitty.typing import BossType

from kitty.fast_data_types import background_opacity_of


def main(args: List[str]) -> None:
    pass


@result_handler(no_ui=True)
def handle_result(args: List[str], data: Dict[str, Any], target_window_id: int, boss: BossType) -> None:
    try:
        toggle_opacity_value = args[1]
    except IndexError:
        toggle_opacity_value = '0.5'

    current_opacity = background_opacity_of(boss.active_window.os_window_id)

    if float(current_opacity) < 1.0:
        boss.set_background_opacity('1.0')
    else:
        boss.set_background_opacity(toggle_opacity_value)
