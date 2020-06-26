function [m,b] = hough_transform(edge_map)

[edge_y, edge_x] = find(edge_map);

H = size(edge_map, 1);
b_range = -H : 1 : H;


m_step = 0.01;
m_max = 5; 
m_min = -m_max;
m_range = m_min : m_step : m_max;

V = zeros(length(m_range), length(b_range));

for i = 1:length(edge_y)
    y = edge_y(i);
    x = edge_x(i);
    for b_index = 1:length(b_range)
        b = b_range(b_index);
            m = -1/x*b+y/x;
            m_index = round((m-m_min)/m_step)+1;
            
        if(m_min <= m && m_max >= m)
            m_index = round((m - m_min)/m_step) + 1;
            V(m_index, b_index) = V(m_index, b_index) + 1;
            
        end
        
    end
    
end


subplot(2,2,2);
imagesc(V);xlabel('b');ylabel('m');

max_vote = max(V(:));
[max_m_index, max_b_index] = find(V == max_vote);
m = m_range(max_m_index);
b = b_range(max_b_index);

end

