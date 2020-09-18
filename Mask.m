%% Create a mask from a matrix A. Modify matrix generation statements for other applications.
A = zeros(83, 83); %Creates an empty matrix to be filled by the statements below.
for i = 1:83
    for j = 1:83
        if j == 0
            A(i, j) = 0;
        elseif i == 0
            A(i, j) = 1;
        else
            A(i, j) = 1-((((i*j)/(83^2))+1)/2);
        end
    end
end

pcolor(A); %Plots the mask. 