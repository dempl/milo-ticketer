echo "Saving/Uploading all changes.."

echo "First, removing previews and SQLite DB Index"

# rm -f .momo/image-previews/*
# rm -f .momo/video-previews/*
# rm -f .momo/album-images-cache/*
# rm -f .momo/db/*
# rm -rf .momo/emails/*


git add --all
git commit -m "auto upload"
git push

cd /home/dule/projects/

# echo "Removing the old copy.."
rm -f momo.zip 

echo "Packing the source.."
zip momo.zip momo/* -r -x momo/image-previews/ 

datetime=$(date +%Y-%m-%d.%H-%M-%S)

zip_filename=$datetime.$(hostname).src.zip

echo "Uploading the source to the scraper.regystro.com server.. [/home/momo remote folder]"
scp -P 2044 momo.zip  root@scraper.regystro.com:/home/momo/$zip_filename


echo "Uploading the source to the backup.regystro.com server [/home/momo remote folder].."
scp momo.zip  root@backup.regystro.com:/home/momo/$zip_filename


