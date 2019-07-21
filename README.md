# CMU Arctic speech data coverter

This repository contains the PowerShell Core script to convert the audio and talking script data of [CMU Arctic speech synthesis database](http://festvox.org/cmu_arctic/index.html) (such as [this](http://festvox.org/cmu_arctic/dbs_slt.html)) into [Azure Cognitive service - Custom Voice](https://azure.microsoft.com/en-us/services/cognitive-services/text-to-speech/) acceptable format.

Invoke the script like the following:

```PowerShell
 ./convert_name.ps1 -sourceScript ./data/arctic.data.txt -targetScript ./output/out.txt -wavSource ./data/wav -wavTarget ./output/wav
```
