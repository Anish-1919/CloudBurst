l=menu('Is there any need to check cctv images of the city in highways and signals :','Yes','No');
originalDate = datestr(datetime('now','Format','dd'));
od=datenum( sscanf(originalDate, '%d') );
if l==1
    k=input('Enter the number of images to be checked ');
    if k>5
        disp('Too many images to be analysed : please ')
    end
    for i=1:k
        [file,path] = uigetfile({'*.jpg';'*.jpeg';'*.png';},'Choose an Image');
        [filepath,name,ext] = fileparts(file);
        if isequal(file,0)
            disp('User selected Cancel and hence no file chosen..');
        elseif strcmp(ext,'.jpg')==1 || strcmp(ext,'.jpeg')==1 || strcmp(ext,'.png')==1
            fullFileName = fullfile(path,file);
            Image=imread(fullFileName);
            %imshow(file);
            text=ocr(Image);
            %disp(strtrim(text.Text))
            if mod(od,2)==0
                if mod(text.Text(end-2),2)~=0
                    disp('Due to Pollution and Odd-Even Rule,A fine has to be imposed on the vehicle due to odd-even rule ')
                else
                    disp('No charges!!-All clear ')
                end
            elseif mod(od,2)==1
                if mod(text.Text(end-2),2)==0
                    disp('Due to Pollution and Odd-Even Rule,A fine has to be imposed on the vehicle due to odd-even rule ')
                else
                    disp('No charges!!-All clear ')
                end
            end
        else
            disp('Invalid File Format');
            error('Invalid Image Selected ! Aborting.....');
        end
    end
 elseif l==2
    disp('There are no necessary images to be analysed ')
end 