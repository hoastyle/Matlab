function data = ShowPointCloud(logFilePath)

data = readLog(logFilePath);

figure,pcshow(cell2mat(data),'VerticalAxis', 'Y', 'VerticalAxisDir', 'Down');xlabel('x m');ylabel('y m');zlabel('z m');title('all');axis equal

pt2d = cell2mat(data);
figure,plot(pt2d(:,1),pt2d(:,3),'.');axis equal;

for i = 1 : length(data)
    figure,pcshow(data{i},'VerticalAxis', 'Y', 'VerticalAxisDir', 'Down');xlabel('x m');ylabel('y m');zlabel('z m');title(num2str(i));axis equal
end



end
function [data] = readLog(accFilePath)

[configFileFid, errMsg] = fopen(accFilePath);
if (configFileFid < 0)
    error('Cannot open %s for read: %s', accFilePath, errMsg);
end
% gVecBuf = [];
% inReadgVec = false;
% flagg=0;

cnt = 0;data = {};
while ~feof(configFileFid)
    lineBuf = strtrim(fgetl(configFileFid));
    vec = str2double(strsplit(lineBuf(1:end), ' '));
    if length(vec) == 1
        if ~isnan(vec)
            cnt = cnt + 1;
            data{cnt,1} = [];
            continue
        else
            continue;
        end
    end
    data{cnt,1} = [data{cnt,1}; vec];
    
end
% G=1;
% g=gVec;
fclose(configFileFid);

end