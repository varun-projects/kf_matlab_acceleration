for i=1:10
  eval(sprintf('A%d = []', i));
end
eval(sprintf('B%d = 56', 1));
xx=eval(sprintf('B%d', 1))

ee = 10;
fname = sprintf('myfile%d.mat', ee);
save(fname,'xx')