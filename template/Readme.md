# Template for AX and TIA Portal workflow
## Setup template

1. If not done, login to the AX registry

1. If not done, login to the GitHub registry
   
    More information you'll find [here](https://github.com/simatic-ax/.github/blob/main/doc/personalaccesstoken.md)

1. create a new library project from template 
      ```cli
      apax create @simatic-ax/tiax --registry https://npm.pkg.github.com
      ```
1. Install the dependencies

   ```cli
   apax install -L 
   ```

   or with update of all packages implicitly 

   ```cli
   apax update -a
   ```
   
   or run script `updateall`

      1. Select `Run Script`
   
            ![](doc/runscript.png)

      2. Select `updateall`
      
            ![](doc/select_updateall.png)

1. Open the `apax.yml` and modify the variable vor `LIB_NAME` (line 13). The value of the parameter must be equal to the name of the project.

      ![](doc/name.png)

1. Set the path to the `Simatic.Lang.Library.Importer.exe`  
   
      It's required, that you set the path to the `Simatic.Lang.Library.Importer.exe`. The path depends on your own TIA Portal installation and it might be differ to the default path:

      `C:\Program Files\Siemens\Automation\Portal V18\Bin`

      To change it, open the File `.env` and modify the following entry to your installation path:
      
      `TIA_PORTAL_INSTALL_PATH="C:\Program Files\Siemens\Automation\Portal V18\Bin"`

1. Optionally adapt the snippets to your namespace

      Adapt the snippet `./snippets/usingNamespace.json`

      ```json
      {
         "USINGAxUnit": {
         "scope": "javascript,typescript,st",
         "prefix": ["USING DemoLibrary"],  // adapt prefix
         "body": [
            "USING Simatic.Ax.DemoLibrary;", // adapt your namespace
            "$0"
         ],
         "description": "Create USING for your library;"
         }    
      }
      ```

      and adapt the snippet `./snippets/namespacesupport.json`

      ```json 
            "NamespaceSupport": {
            "scope": "javascript,typescript,st",
            "prefix": ["CreateNamespace for DemoLibrary"], //adapt prefix
            "body": [
                  "NAMESPACE Simatic.Ax.DemoLibrary", //adapt your namespace
                  "\t$0",
                  "END_NAMESPACE"
            ],
            "description": "Creates an namespace template"
            }    
      ```

## Create the library

The script `createlib` execute the following steps:

- cleanup old library artifacts 
- compile the ST code (apax build)
- generate the handover library documents (st2tia)
- generate the TIA Portal Library .al18 in the folder `bin\TIAPortalGlobalLibrary`

To execute the script, enter `apax createlib' in the terminal

```
apax createlib
```