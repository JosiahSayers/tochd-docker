# tochd docker image

This docker image provides an easy way to run https://github.com/thingsiplay/tochd without any setup on your local system.

## How to run

There are two volume mounts required to run this image successfully. One for the input DIR that contains all of your current game files and another for the output DIR where your new `.chd` files will be stored. A basic example of running this image would be

```bash
docker run \
  --volume <YOUR/CURRENT/GAME/LIBRARY>:/in \
  --volume <FINAL/CHD/DIRECTORY>:/out \
  josiahsayers15/tochd
```

If you would like to change the default options for tochd (recommended), you can pass another flag to your docker run command. To see available options you can run the following command. An example output is included in this repo in `help.md` but I recommend running this command as options may change over time.

```bash
docker run josiahsayers15/tochd tochd -h
```

Using the options from the previous command you can change the behavior of tochd. Here is an example where tochd will run 4 conversions in parallel, with minimal output, and will automatically choose between CD/DVD formatting based on file size.

```bash
docker run \
  --volume <YOUR/CURRENT/GAME/LIBRARY>:/in \
  --volume <FINAL/CHD/DIRECTORY>:/out \
  -e TOCHD_ARGS="-m auto -q -p -t 4" \
  josiahsayers15/tochd
```

## Enhancements

This image contains additional functionality that is not in the tochd program. On startup it will compare the input and output directories and skip any files that already exist in the output directory. This makes it so that if the container ever stops running you will be able to resume the conversion by simply running the container again. Tochd on it's own does not include functionality like this and will start over, overwriting every file that already exists in your output directory.
