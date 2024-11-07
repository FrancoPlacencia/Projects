package upload;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.tvmtz.volley_api.util.AppResponseUtil;
import org.tvmtz.volley_api.util.ExcelUtil;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

@Slf4j
@Service
public class UploadServiceImpl implements UploadService {
    private String fileLocation;

    @Override
    public ResponseEntity<CommonResponseDTO> uploadFile(MultipartFile file) {

        if (!ExcelUtil.hasExcelFormat(file.getContentType())) {
            return new ResponseEntity<>(AppResponseUtil.contentTypeNotSupported(), HttpStatus.BAD_REQUEST);
        }
        uploadExcelFile(file);
        return null;
    }

    private void uploadExcelFile(MultipartFile file) {
        try {
            InputStream inputStream = file.getInputStream();
            File currentDirectory = new File(".");
            String path = currentDirectory.getAbsolutePath();
            log.info("path {}", path);
            fileLocation = path.substring(0, path.length() - 1) + file.getOriginalFilename();
            log.info("fileLocation {}", fileLocation);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
