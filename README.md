# Agent Skills

可复用的个人 Agent Skill 集合，已在 GitHub 公开发布：[njczh/agent-skills](https://github.com/njczh/agent-skills)。采用 [MIT 许可证](LICENSE)。

## 首批 Skill

| Skill | 用途 | 使用条件 |
|---|---|---|
| [expression-coach](skills/expression-coach/SKILL.md) | 理解、评价和训练中文 Prompt 表达 | 使用当前对话材料；侧边聊天为可选能力 |
| [scoop-manifest-creator](skills/scoop-manifest-creator/SKILL.md) | 调研软件并编写 Scoop manifest | Windows/Scoop 任务；能读取官方资料和目标 bucket；安装验证需 Scoop/PowerShell |
| [scoop-bucket-commit-message](skills/scoop-bucket-commit-message/SKILL.md) | 按目标 Scoop bucket 规则拟定提交信息或 PR 标题 | 实际变更及版本信息；仅拟稿不要求 Git 写权限 |

`agents/openai.yaml` 是 Codex 的可选界面元数据。以下命令以 Codex 为目标，其他 Agent 的兼容性尚未验证。

## 安装

安装 Node.js 后，在目标项目目录中通过 [Skills CLI](https://github.com/vercel-labs/skills) 运行所需命令：

```bash
npx skills add njczh/agent-skills --skill expression-coach -a codex
npx skills add njczh/agent-skills --skill scoop-manifest-creator -a codex
npx skills add njczh/agent-skills --skill scoop-bucket-commit-message -a codex
```

默认安装到当前项目；需要在所有项目中使用时，在对应命令末尾加 `-g`。已有同名 Skill 时，请先核对来源和内容再更新。手动安装时，复制完整的 Skill 目录，包括其中的 `LICENSE`。

## 维护与发布

本仓库是公开版的维护来源，已安装的副本按需更新。

## 许可证

除另有明确声明的第三方内容外，本仓库的 Skill 指令、随附参考材料及界面元数据采用 [MIT 许可证](LICENSE)。每个独立 Skill 目录也包含相同的完整 `LICENSE`，其 `SKILL.md` 标注 `license: MIT`。

MIT 允许使用、修改、商用和再分发；复制或分发全部或实质性部分时，应保留版权与许可声明。按许可证原文提供免责和无担保条款，不另加禁止商用等限制。

通过链接引用的第三方资料、目标应用及工具仍适用各自的许可；本仓库的 MIT 声明不替这些内容重新授权。
