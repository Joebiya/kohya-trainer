@echo off
REM LoRA Training Script for Windows
REM Make sure to activate venv first: .\venv\Scripts\activate

set CONFIG_DIR=%~dp0lora_projects\Chinese_painting
set TRAINING_CONFIG=%CONFIG_DIR%\training_config.toml
set DATASET_CONFIG=%CONFIG_DIR%\dataset_config.toml

echo ==========================================
echo   LoRA Training Script - Chinese_painting
echo ==========================================
echo.
echo Config file: %TRAINING_CONFIG%
echo Dataset config: %DATASET_CONFIG%
echo.

accelerate launch --num_cpu_threads_per_process=1 train_network.py ^
    --config_file="%TRAINING_CONFIG%" ^
    --dataset_config="%DATASET_CONFIG%"

echo.
echo Training completed!
pause
