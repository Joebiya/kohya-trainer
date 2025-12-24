# LoRA 本地训练指南

基于 Kohya-ss/sd-scripts 的 LoRA 训练流程

---

## 1. 数据集放置

将训练图片放入以下目录：

```
lora_projects\Chinese_painting\dataset\
```

每张图片需配备同名 `.txt` 标签文件：

```
dataset/
├── image1.png
├── image1.txt
├── image2.jpg
├── image2.txt
└── ...
```

支持格式：`.png`、`.jpg`、`.jpeg`、`.webp`、`.bmp`

---

## 2. 配置文件

训练相关配置文件位于：

| 文件 | 路径 | 说明 |
|------|------|------|
| 训练配置 | `lora_projects/Chinese_painting/training_config.toml` | 学习率、epoch、batch size 等参数 |
| 数据集配置 | `lora_projects/Chinese_painting/dataset_config.toml` | 图片路径、分辨率、标签处理等 |

主要可调参数（training_config.toml）：

| 参数 | 说明 |
|------|------|
| max_train_epochs | 训练轮数 |
| train_batch_size | 批次大小 |
| unet_lr | UNet 学习率 |
| network_dim | LoRA 维度 |

---

## 3. 开始训练

```powershell
cd C:\Coding\StableDiffusion\kohya-trainer
.\venv\Scripts\activate
.\train_lora.bat
```

训练完成后，模型输出至：

```
lora_projects\Chinese_painting\output\
```

---

## 4. 项目文件结构

```
kohya-trainer/
├── .gitignore                   # Git 忽略配置
├── README.md                    # 本说明文档
├── requirements.txt             # Python 依赖
├── train_network.py             # LoRA 训练主脚本
├── train_lora.bat               # 训练启动脚本
├── library/                     # 核心库
│   ├── __init__.py
│   ├── config_util.py           # 配置工具
│   ├── custom_train_functions.py# 训练函数
│   ├── model_util.py            # 模型工具
│   ├── train_util.py            # 训练工具
│   └── ...
├── networks/                    # 网络定义
│   └── lora.py                  # LoRA 网络实现
└── lora_projects/               # LoRA 训练项目
    └── Chinese_painting/        # 中国画风格项目
        ├── training_config.toml # 训练参数配置
        ├── dataset_config.toml  # 数据集配置
        ├── dataset/             # 训练图片目录
        │   ├── image1.png
        │   ├── image1.txt
        │   └── ...
        └── output/              # 模型输出目录
```
