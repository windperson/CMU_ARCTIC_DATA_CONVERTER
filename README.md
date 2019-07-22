# CMU Arctic speech data coverter

This repository contains the [PowerShell Core](http://github.com/PowerShell/PowerShell) script to convert the audio and talking script data of [CMU Arctic speech synthesis database](http://festvox.org/cmu_arctic/index.html) (such as [this](http://festvox.org/cmu_arctic/dbs_slt.html)) into [Azure Cognitive service - Custom Voice](http://azure.microsoft.com/en-us/services/cognitive-services/text-to-speech/) acceptable format.

Invoke the script like the following, if you extract the CMU arctic speech data zip file in `data` folder:

```Shell
./convert_name.ps1 -sourceScript ./data/cmu_us_slt_arctic/etc/arctic.data -targetScript ./output/script.txt -wavSource ./data/cmu_us_slt_arctic/wav -wavTarget ./output/wav
```

The output folder will contain the resulting `script.txt` & `wav.zip` files, that are acceptable input training data that you can upload to Azure Custom Voice portal.
