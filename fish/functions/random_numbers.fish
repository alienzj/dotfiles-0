function random_numbers --argument n total_sum
python -c "import numpy as np; import sys; nums = np.random.rand(int(sys.argv[1])); print(nums/np.sum(nums)*(int(sys.argv[2])))" $n $total_sum
end
