package mapper;
import dto.CustomerDto;
import javaClasses.Customer;


/**
 *
 * @author Nusrath
 */
public class CustomerMapper {


    public static Customer toEntity(CustomerDto dto) {
        Customer c = new Customer();
        c.setName(dto.getName());
        c.setEmail(dto.getEmail());
        c.setPhone(dto.getPhone());
        return c;
    }

    public static CustomerDto toDTO(Customer c) {
        return new CustomerDto(c.getName(), c.getEmail(), c.getPhone());
    }


}
