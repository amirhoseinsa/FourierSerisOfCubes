iterateNum = 1;
for i = 1:iterateNum
    % generate random periodic series with length of 5*iterateNum
    r1 = randi (2,5*iterateNum,1);
    Y = cat(1,r1,r1);
    
    for j = 1:size(Y)
        if Y(j) == 2
            Y(j) = 1;
        else 
            Y(j) = -1;
        end
    end
    
    X = [];
    for j = 1:size(Y)
        X = cat(1,X,j);
    end
    
    % Generate fourier series
    f = fit(X,Y,'fourier3');
%     disp (f);
    plot(f,X,Y); hold on;
    
    %Extract series of base sins and cosin
    fres = [];
    for i2= 1:3
        if i2 == 1
            a = f.a1;
        elseif i2 == 2
            a = f.a2;
        else
            a = f.a3;
        end
        res = [];
        for i3 =1:size(Y)
            tmp = sin(X(i3)*f.w*i2);
            res = [res tmp];
        end
        fres = cat(1,fres,res);
        y = a*sin(X*f.w*i2);
        plot(X,y); hold on;
    end
    
    for i2= 1:3
        if i2 == 1
            a = f.a1;
        elseif i2 == 2
            a = f.a2;
        else
            a = f.a3;
        end
        res = [];
        for i3 =1:size(Y)
            tmp = cos(X(i3)*f.w*i2);
            res = [res tmp];
        end
        fres = cat(1,fres,res);
        y = a*cos(X*f.w*i2);
        plot(X,y); 
    end
    xVector = size(X);
    legend('data','fitted curve','1st sin','2nd sin','3rd sin','1st cos','2nd cos','3rd cos');
    hold off;
    if i ~= iterateNum
        figure();   
    end
end
% X = [1;2;3;4;5;6;7;8];
% Y = [1 ;1 ;0;1 ; 1 ;1 ;0;1];
% load enso;
% f = fit(X,Y,'fourier3')
% disp (f);
% plot(f,X,Y)