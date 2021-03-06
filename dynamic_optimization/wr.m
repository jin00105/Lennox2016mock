function filenum = wr(interestp,parambundle,pname,receptacle,param,type,cont,filenum,msg)
  simdata = 0;
  if type == 1 % writes out files for simulation's conservation benefit result
    name = './data/st0.csv';
    if ~cont
      filenum = 0;
      while isfile(name)
        name = sprintf('./data/st%d.csv',filenum);
        filenum = filenum + 1;
      end
      if filenum > 0
        filenum = filenum - 1;
      end
      filename = strcat(name);
      fileID = fopen(filename,'w');
      fprintf(fileID,'# %s\n',msg);
      for i = 1:length(parambundle)
        l = sprintf('%.3f,',parambundle{i});
        fprintf(fileID,'# %s: %s\n',pname{i},l(1:end-1));
      end
      header = sprintf('%s,',pname{interestp});
      header = strcat(header,'cumb\n');
      fprintf(fileID,header);
      fclose(fileID);
    elseif cont
      name = sprintf('./data/st%d.csv',filenum);
      fileID = fopen(name,'a+');
      l = sprintf('%.2f,',[param(interestp),receptacle{1}]);
      l = strcat(l(1:end-1),'\n');
      fprintf(fileID,l);
      fclose(fileID);
    end
  elseif type == 0 && simdata % writes out files of simulation data (t,xb,xr, etc.)
    fileparam = sprintf('%.2f,',param(interestp));
    filename = strcat('./data/',fileparam(1:end-1),'.csv');
    fileID = fopen(filename,'w');
    for i = 1:length(parambundle)
      l = sprintf('%.3f,',parambundle{i});
      fprintf(fileID,'# %s: %s\n',pname{i},l(1:end-1));
    end
    st = param(26); %simtime
    fprintf(fileID,'t,x,xf,xr,xb,tjs,C,fundt,ben,buy\n');
    fprintf(fileID,'%d,%.2f,%.2f,%.2f,%.2f,%d,%.2f,%.2f,%.2f,%d\n',...
      [receptacle{2}(1:st);receptacle{3}(1:st);receptacle{4}(1:st);receptacle{5}(1:st);receptacle{6}(1:st);receptacle{7};receptacle{8};receptacle{9};receptacle{10};receptacle{11}]); %t,x,xf,xr,xb,fundt,tjs,C,ben,buy
    fclose(fileID);
    fileID = 1;
  end

