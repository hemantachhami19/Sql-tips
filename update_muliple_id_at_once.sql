-- Updating multiples ids at once
-- 1st approach
UPDATE employees
SET address = (case
                   when id = 1 then 'address1'
                   when id = 2 then 'address2'
                   when id = 3 then 'address3'
    end)
WHERE id in (1, 2, 3);

-- 2nd approach
UPDATE employees as e
JOIN (
    SELECT 1 as id, 'address1' as address
    UNION ALL
    SELECT 2 as id, 'address2' as address
    UNION ALL
    SELECT 3 as id, 'address3' as address
) as a
ON u.id = a.id SET u.address = a.address;
