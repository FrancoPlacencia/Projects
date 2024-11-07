package upload;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface UploadService {
    ResponseEntity<CommonResponseDTO> uploadFile(MultipartFile file);
}
