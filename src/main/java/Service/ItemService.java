package Service;

import dao.ItemDao;
import javaClasses.ItemClass;

import java.sql.SQLException;
import java.util.List;

public class ItemService {
    private final ItemDao itemDao = new ItemDao();

    public List<ItemClass> listAll() throws SQLException, ClassNotFoundException {
        return itemDao.getAllItems();
    }

    public boolean createItem(ItemClass item) throws SQLException, ClassNotFoundException {
        // Add validation or business rules if needed
        return itemDao.addItem(item);
    }

    public boolean updateItem(ItemClass item) throws SQLException, ClassNotFoundException {
        // We'll need to implement updateItem in dao
        return itemDao.updateItem(item);
    }

    public boolean deleteItem(int id) throws SQLException, ClassNotFoundException {
        return itemDao.deleteItem(id);
    }

    public ItemClass getItemById(int id) throws SQLException, ClassNotFoundException {
        return itemDao.getItemById(id);
    }
}
