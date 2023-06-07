package kh.final_project.services;

import kh.final_project.repositories.GalleryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GalleryService {

    private GalleryDAO galleryDAO;

    @Autowired
    public GalleryService(GalleryDAO galleryDAO) {
        this.galleryDAO = galleryDAO;
    }
}
