package upload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api")
public class UploadController {

    @Autowired
    UploadService uploadService;

    @PostMapping("/upload")
    public ResponseEntity<CommonResponseDTO> uploadFile(MultipartFile file) {
        return uploadService.uploadFile(file);
    }
}
