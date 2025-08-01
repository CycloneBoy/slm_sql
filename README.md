# SLM-SQL: An Exploration of Small Language Models for Text-to-SQL

### Important Links

📖[Arxiv Paper](https://arxiv.org/abs/2507.22478) |
🤗[HuggingFace](https://huggingface.co/collections/cycloneboy/slm-sql-688b02f99f958d7a417658dc) |
🤖[ModelScope](https://modelscope.cn/collections/SLM-SQL-624bb6a60e9643) |

## News

+ `August 1, 2025`: The SLM-SQL 1.5B model achieved an Execution Accuracy (EX) of 70.49% on the BIRD test set, while the 0.5B model attained an EX of 61.82%.
+ `July 31, 2025`: Upload model to modelscope and huggingface.
+ `July 30, 2025`: Publish the paper to arxiv

## Introduction

> Large language models (LLMs) have demonstrated strong performance in translating natural language questions into SQL
> queries (Text-to-SQL). In contrast, small language models (SLMs) ranging from 0.5B to 1.5B parameters currently
> underperform on Text-to-SQL tasks due to their limited logical reasoning capabilities. However, SLMs offer inherent
> advantages in inference speed and suitability for edge deployment. To explore their potential in Text-to-SQL
> applications, we leverage recent advancements in post-training techniques. Specifically, we used the open-source
> SynSQL-2.5M dataset to construct two derived datasets: SynSQL-Think-916K for SQL generation and
> SynSQL-Merge-Think-310K
> for SQL merge revision. We then applied supervised fine-tuning and reinforcement learning-based post-training to the
> SLM, followed by inference using a corrective self-consistency approach. Experimental results validate the
> effectiveness
> and generalizability of our method, SLM-SQL. On the BIRD development set, the five evaluated models achieved an
> average
> improvement of 31.4 points. Notably, the 0.5B model reached 56.87\% execution accuracy (EX), while the 1.5B model
> achieved 67.08\% EX. We will release our dataset, model, and code to github: https://github.com/CycloneBoy/slm_sql.

### Framework

<img src="data/image/slmsql_framework.png"  height="500" alt="slmsql_framework">

### Main Results

<img src="data/image/slmsql_bird_result.png"  height="500" alt="slm_sql_result">


<img src="data/image/slmsql_bird_main.png"  height="500" alt="slmsql_bird_main">

<img src="data/image/slmsql_spider_main.png"  height="500" alt="slmsql_spider_main">

Performance Comparison of different Text-to-SQL methods on BIRD dev and test dataset.

<img src="data/image/slmsql_ablation_study.png"  height="300" alt="slmsql_ablation_study">

## Model

| **Model**                                | Base Model                   | Train Method | Modelscope                                                                                        | HuggingFace                                                                                  |
|------------------------------------------|------------------------------|--------------|---------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| SLM-SQL-Base-0.5B                        | Qwen2.5-Coder-0.5B-Instruct  | SFT          | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/SLM-SQL-Base-0.5B)                        | [🤗 HuggingFace](https://huggingface.co/cycloneboy/SLM-SQL-Base-0.5B)                        |
| SLM-SQL-0.5B                             | Qwen2.5-Coder-0.5B-Instruct  | SFT + GRPO   | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/SLM-SQL-0.5B)                             | [🤗 HuggingFace](https://huggingface.co/cycloneboy/SLM-SQL-0.5B)                             |
| CscSQL-Merge-Qwen2.5-Coder-0.5B-Instruct | Qwen2.5-Coder-0.5B-Instruct  | SFT + GRPO   | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/CscSQL-Merge-Qwen2.5-Coder-0.5B-Instruct) | [🤗 HuggingFace](https://huggingface.co/cycloneboy/CscSQL-Merge-Qwen2.5-Coder-0.5B-Instruct) |
| SLM-SQL-Base-1.5B                        | Qwen2.5-Coder-1.5B-Instruct  | SFT          | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/SLM-SQL-Base-1.5B)                        | [🤗 HuggingFace](https://huggingface.co/cycloneboy/SLM-SQL-Base-1.5B)                        |
| SLM-SQL-1.5B                             | Qwen2.5-Coder-1.5B-Instruct  | SFT + GRPO   | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/SLM-SQL-1.5B)                             | [🤗 HuggingFace](https://huggingface.co/cycloneboy/SLM-SQL-1.5B)                             |
| CscSQL-Merge-Qwen2.5-Coder-1.5B-Instruct | Qwen2.5-Coder-1.5B-Instruct  | SFT + GRPO   | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/CscSQL-Merge-Qwen2.5-Coder-1.5B-Instruct) | [🤗 HuggingFace](https://huggingface.co/cycloneboy/CscSQL-Merge-Qwen2.5-Coder-1.5B-Instruct) |
| SLM-SQL-Base-0.6B                        | Qwen3-0.6B                   | SFT          | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/SLM-SQL-Base-0.6B)                        | [🤗 HuggingFace](https://huggingface.co/cycloneboy/SLM-SQL-Base-0.6B)                        |
| SLM-SQL-0.6B                             | Qwen3-0.6B                   | SFT + GRPO   | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/SLM-SQL-0.6B)                             | [🤗 HuggingFace](https://huggingface.co/cycloneboy/SLM-SQL-0.6B)                             |
| SLM-SQL-Base-1.3B                        | deepseek-coder-1.3b-instruct | SFT          | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/SLM-SQL-Base-1.3B )                       | [🤗 HuggingFace](https://huggingface.co/cycloneboy/SLM-SQL-Base-1.3B )                       |
| SLM-SQL-1.3B                             | deepseek-coder-1.3b-instruct | SFT + GRPO   | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/SLM-SQL-1.3B )                            | [🤗 HuggingFace](https://huggingface.co/cycloneboy/SLM-SQL-1.3B )                            |
| SLM-SQL-Base-1B                          | Llama-3.2-1B-Instruct        | SFT          | [🤖 Modelscope](https://modelscope.cn/models/cycloneboy/SLM-SQL-Base-1B )                         | [🤗 HuggingFace](https://huggingface.co/cycloneboy/SLM-SQL-Base-1B )                         |

## Dataset

| **Dataset**                | Modelscope                                                                         | HuggingFace                                                                          |
|----------------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| SynsQL-Think-916k          | [🤖 Modelscope](https://modelscope.cn/datasets/cycloneboy/SynsQL-Think-916k)       | [🤗 HuggingFace](https://huggingface.co/datasets/cycloneboy/SynsQL-Think-916k)       |
| SynsQL-Merge-Think-310k    | [🤖 Modelscope](https://modelscope.cn/datasets/cycloneboy/SynsQL-Merge-Think-310k) | [🤗 HuggingFace](https://huggingface.co/datasets/cycloneboy/SynsQL-Merge-Think-310k) |
| bird train and dev dataset | [🤖 Modelscope](https://modelscope.cn/datasets/cycloneboy/bird_train)              | [🤗 HuggingFace](https://huggingface.co/datasets/cycloneboy/bird_train)              |

## TODO

- [ ] Release inference code
- [ ] Upload Model
- [ ] Release training code
- [ ] Fix bug
- [ ] Update doc

## Thanks to the following projects

- [csc_sql](https://github.com/CycloneBoy/csc_sql)
- [open-r1](https://github.com/huggingface/open-r1)
- [OmniSQL](https://github.com/RUCKBReasoning/OmniSQL)

## Citation

```bibtex

@misc{sheng2025slmsqlexplorationsmalllanguage,
      title={SLM-SQL: An Exploration of Small Language Models for Text-to-SQL}, 
      author={Lei Sheng and Shuai-Shuai Xu},
      year={2025},
      eprint={2507.22478},
      archivePrefix={arXiv},
      primaryClass={cs.CL},
      url={https://arxiv.org/abs/2507.22478}, 
}

@misc{sheng2025cscsqlcorrectiveselfconsistencytexttosql,
      title={CSC-SQL: Corrective Self-Consistency in Text-to-SQL via Reinforcement Learning}, 
      author={Lei Sheng and Shuai-Shuai Xu},
      year={2025},
      eprint={2505.13271},
      archivePrefix={arXiv},
      primaryClass={cs.CL},
      url={https://arxiv.org/abs/2505.13271}, 
}
```