.class public Lcom/behance/sdk/files/LocalImageLoader;
.super Ljava/lang/Object;
.source "LocalImageLoader.java"


# static fields
.field private static albumsAndImageSourcesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile cacheCleared:Z

.field private static volatile inProgress:Z

.field private static lockObject:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 43
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/behance/sdk/files/LocalImageLoader;->lockObject:Ljava/lang/Object;

    .line 44
    sput-boolean v1, Lcom/behance/sdk/files/LocalImageLoader;->cacheCleared:Z

    .line 45
    sput-boolean v1, Lcom/behance/sdk/files/LocalImageLoader;->inProgress:Z

    return-void
.end method

.method public static clearCachedAlbumAndImagesData()V
    .registers 7

    .prologue
    .line 89
    sget-object v4, Lcom/behance/sdk/files/LocalImageLoader;->lockObject:Ljava/lang/Object;

    monitor-enter v4

    .line 90
    :try_start_3
    sget-object v3, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    if-eqz v3, :cond_44

    .line 91
    sget-object v3, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v0, "albums":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    .local v1, "imageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    :cond_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "albums":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    check-cast v0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;

    .line 92
    .restart local v0    # "albums":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getImages()Ljava/util/List;

    .end local v1    # "imageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    move-result-object v1

    .line 93
    .restart local v1    # "imageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    if-eqz v1, :cond_d

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_d

    .line 94
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_29
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/behance/sdk/project/modules/ImageModule;

    .line 95
    .local v2, "localImage":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-virtual {v2}, Lcom/behance/sdk/project/modules/ImageModule;->recycleBitmaps()V

    goto :goto_29

    .line 105
    .end local v2    # "localImage":Lcom/behance/sdk/project/modules/ImageModule;
    :catchall_39
    move-exception v3

    monitor-exit v4
    :try_end_3b
    .catchall {:try_start_3 .. :try_end_3b} :catchall_39

    throw v3

    .line 100
    :cond_3c
    :try_start_3c
    sget-object v3, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 101
    const/4 v3, 0x0

    sput-object v3, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    .line 103
    :cond_44
    sget-boolean v3, Lcom/behance/sdk/files/LocalImageLoader;->inProgress:Z

    if-eqz v3, :cond_4b

    .line 104
    const/4 v3, 0x1

    sput-boolean v3, Lcom/behance/sdk/files/LocalImageLoader;->cacheCleared:Z

    .line 105
    :cond_4b
    monitor-exit v4
    :try_end_4c
    .catchall {:try_start_3c .. :try_end_4c} :catchall_39

    .line 106
    return-void
.end method

.method public static getAlbumsList(Landroid/content/Context;ZZ)Ljava/util/List;
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "forceRefresh"    # Z
    .param p2, "showImageSelectionSources"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "ZZ)",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    if-nez p1, :cond_e

    sget-object v5, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    if-eqz v5, :cond_e

    sget-object v5, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_89

    .line 48
    :cond_e
    sget-object v6, Lcom/behance/sdk/files/LocalImageLoader;->lockObject:Ljava/lang/Object;

    monitor-enter v6

    .line 49
    const/4 v5, 0x1

    :try_start_12
    sput-boolean v5, Lcom/behance/sdk/files/LocalImageLoader;->inProgress:Z

    .line 50
    const/4 v5, 0x0

    sput-boolean v5, Lcom/behance/sdk/files/LocalImageLoader;->cacheCleared:Z

    .line 51
    monitor-exit v6
    :try_end_18
    .catchall {:try_start_12 .. :try_end_18} :catchall_31

    .line 52
    invoke-static {p0}, Lcom/behance/sdk/files/LocalImageLoader;->getListOfAlbums(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 53
    .local v3, "deviceAlbums":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/files/ImageAlbum;>;"
    sget-object v6, Lcom/behance/sdk/files/LocalImageLoader;->lockObject:Ljava/lang/Object;

    monitor-enter v6

    .line 54
    :try_start_1f
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    sput-object v5, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    .line 55
    sget-boolean v5, Lcom/behance/sdk/files/LocalImageLoader;->cacheCleared:Z

    if-eqz v5, :cond_34

    .line 56
    const/4 v5, 0x0

    sput-boolean v5, Lcom/behance/sdk/files/LocalImageLoader;->cacheCleared:Z

    .line 57
    sget-object v5, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    monitor-exit v6
    :try_end_30
    .catchall {:try_start_1f .. :try_end_30} :catchall_82

    .line 76
    .end local v3    # "deviceAlbums":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/files/ImageAlbum;>;"
    :goto_30
    return-object v5

    .line 51
    :catchall_31
    move-exception v5

    :try_start_32
    monitor-exit v6
    :try_end_33
    .catchall {:try_start_32 .. :try_end_33} :catchall_31

    throw v5

    .line 59
    .restart local v3    # "deviceAlbums":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/files/ImageAlbum;>;"
    :cond_34
    if-eqz p2, :cond_52

    .line 61
    :try_start_36
    new-instance v1, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;

    const-string v5, ""

    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CAMERA:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    invoke-direct {v1, v5, v7}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;-><init>(Ljava/lang/String;Lcom/behance/sdk/enums/BehanceSDKAlbumType;)V

    .line 62
    .local v1, "cameraAlbumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    sget-object v5, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    new-instance v2, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;

    const-string v5, ""

    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CREATIVE_CLOUD:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    invoke-direct {v2, v5, v7}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;-><init>(Ljava/lang/String;Lcom/behance/sdk/enums/BehanceSDKAlbumType;)V

    .line 64
    .local v2, "ccAlbumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    sget-object v5, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .end local v1    # "cameraAlbumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    .end local v2    # "ccAlbumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    :cond_52
    if-eqz v3, :cond_85

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_85

    .line 67
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_85

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/behance/sdk/files/ImageAlbum;

    .line 68
    .local v4, "imageAlbum":Lcom/behance/sdk/files/ImageAlbum;
    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;

    invoke-virtual {v4}, Lcom/behance/sdk/files/ImageAlbum;->getName()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->DEVICE_ALBUM:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    invoke-direct {v0, v7, v8}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;-><init>(Ljava/lang/String;Lcom/behance/sdk/enums/BehanceSDKAlbumType;)V

    .line 69
    .local v0, "albumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    invoke-virtual {v4}, Lcom/behance/sdk/files/ImageAlbum;->getImages()Ljava/util/List;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->setImages(Ljava/util/List;)V

    .line 70
    sget-object v7, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5e

    .line 74
    .end local v0    # "albumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    .end local v4    # "imageAlbum":Lcom/behance/sdk/files/ImageAlbum;
    :catchall_82
    move-exception v5

    monitor-exit v6
    :try_end_84
    .catchall {:try_start_36 .. :try_end_84} :catchall_82

    throw v5

    .line 73
    :cond_85
    const/4 v5, 0x0

    :try_start_86
    sput-boolean v5, Lcom/behance/sdk/files/LocalImageLoader;->inProgress:Z

    .line 74
    monitor-exit v6
    :try_end_89
    .catchall {:try_start_86 .. :try_end_89} :catchall_82

    .line 76
    .end local v3    # "deviceAlbums":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/files/ImageAlbum;>;"
    :cond_89
    sget-object v5, Lcom/behance/sdk/files/LocalImageLoader;->albumsAndImageSourcesList:Ljava/util/List;

    goto :goto_30
.end method

.method public static getFromAlbumWithImageSelectionSources(Landroid/content/Context;I)Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "albumIndex"    # I

    .prologue
    const/4 v1, 0x0

    .line 80
    invoke-static {p0, v1, v1}, Lcom/behance/sdk/files/LocalImageLoader;->getAlbumsList(Landroid/content/Context;ZZ)Ljava/util/List;

    move-result-object v0

    .line 81
    .local v0, "albumsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;>;"
    if-eqz v0, :cond_14

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, p1, :cond_14

    .line 82
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;

    .line 84
    :goto_13
    return-object v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private static getListOfAlbums(Landroid/content/Context;)Ljava/util/List;
    .registers 9
    .param p0, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/files/ImageAlbum;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    invoke-static {p0}, Lcom/behance/sdk/files/LocalImageLoader;->getListOfImages(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    .line 111
    .local v4, "listOfImages":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 112
    .local v3, "imageAlbums":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/behance/sdk/files/ImageAlbum;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_36

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/behance/sdk/project/modules/ImageModule;

    .line 113
    .local v5, "localImage":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-virtual {v5}, Lcom/behance/sdk/project/modules/ImageModule;->getAlbumName()Ljava/lang/String;

    move-result-object v0

    .line 115
    .local v0, "albumName":Ljava/lang/String;
    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2d

    .line 116
    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/behance/sdk/files/ImageAlbum;

    .line 121
    .local v2, "imageAlbum":Lcom/behance/sdk/files/ImageAlbum;
    :goto_29
    invoke-virtual {v2, v5}, Lcom/behance/sdk/files/ImageAlbum;->addImage(Lcom/behance/sdk/project/modules/ImageModule;)V

    goto :goto_d

    .line 118
    .end local v2    # "imageAlbum":Lcom/behance/sdk/files/ImageAlbum;
    :cond_2d
    new-instance v2, Lcom/behance/sdk/files/ImageAlbum;

    invoke-direct {v2, v0}, Lcom/behance/sdk/files/ImageAlbum;-><init>(Ljava/lang/String;)V

    .line 119
    .restart local v2    # "imageAlbum":Lcom/behance/sdk/files/ImageAlbum;
    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_29

    .line 123
    .end local v0    # "albumName":Ljava/lang/String;
    .end local v2    # "imageAlbum":Lcom/behance/sdk/files/ImageAlbum;
    .end local v5    # "localImage":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_36
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v6

    invoke-direct {v1, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 124
    .local v1, "albumsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/files/ImageAlbum;>;"
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 125
    return-object v1
.end method

.method private static getListOfImages(Landroid/content/Context;)Ljava/util/List;
    .registers 15
    .param p0, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v13, 0x0

    .line 129
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .local v12, "imagesTempList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v13

    const-string v0, "_data"

    aput-object v0, v2, v3

    const/4 v0, 0x2

    const-string v1, "bucket_display_name"

    aput-object v1, v2, v0

    .line 132
    .local v2, "projection":[Ljava/lang/String;
    new-array v8, v3, [Landroid/database/Cursor;

    .line 133
    .local v8, "cursors":[Landroid/database/Cursor;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v3, ""

    const/4 v4, 0x0

    check-cast v4, [Ljava/lang/String;

    const-string v5, "_data ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    aput-object v0, v8, v13

    .line 136
    array-length v1, v8

    move v0, v13

    :goto_2e
    if-ge v0, v1, :cond_6f

    aget-object v7, v8, v0

    .line 137
    .local v7, "cursor":Landroid/database/Cursor;
    :cond_32
    :goto_32
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_6c

    .line 138
    const-string v3, "_id"

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 139
    .local v10, "id":Ljava/lang/String;
    const-string v3, "_data"

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 140
    .local v9, "file":Ljava/lang/String;
    const-string v3, "bucket_display_name"

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 141
    .local v6, "albumName":Ljava/lang/String;
    new-instance v11, Lcom/behance/sdk/files/LocalImage;

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-direct {v11, v4, v5, v9}, Lcom/behance/sdk/files/LocalImage;-><init>(JLjava/lang/String;)V

    .line 142
    .local v11, "image":Lcom/behance/sdk/files/LocalImage;
    invoke-virtual {v11, v6}, Lcom/behance/sdk/files/LocalImage;->setAlbumName(Ljava/lang/String;)V

    .line 144
    invoke-virtual {v11}, Lcom/behance/sdk/files/LocalImage;->getWidth()I

    move-result v3

    if-lez v3, :cond_32

    .line 145
    invoke-interface {v12, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_32

    .line 136
    .end local v6    # "albumName":Ljava/lang/String;
    .end local v9    # "file":Ljava/lang/String;
    .end local v10    # "id":Ljava/lang/String;
    .end local v11    # "image":Lcom/behance/sdk/files/LocalImage;
    :cond_6c
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e

    .line 148
    .end local v7    # "cursor":Landroid/database/Cursor;
    :cond_6f
    return-object v12
.end method
