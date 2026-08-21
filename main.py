"""Точка входа приложения расчета теплообменников на витых трубах."""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "src"))


def main() -> None:
    from twisted_tube_calc.gui.app import run_app

    run_app()


if __name__ == "__main__":
    main()
