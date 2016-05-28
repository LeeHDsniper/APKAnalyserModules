.class Lit/sephiroth/android/library/exif2/ExifReader;
.super Ljava/lang/Object;
.source "ExifReader.java"


# instance fields
.field private final mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/exif2/ExifInterface;)V
    .registers 2
    .param p1, "iRef"    # Lit/sephiroth/android/library/exif2/ExifInterface;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifReader;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    .line 35
    return-void
.end method


# virtual methods
.method protected read(Ljava/io/InputStream;I)Lit/sephiroth/android/library/exif2/ExifData;
    .registers 13
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    iget-object v7, p0, Lit/sephiroth/android/library/exif2/ExifReader;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    invoke-static {p1, p2, v7}, Lit/sephiroth/android/library/exif2/ExifParser;->parse(Ljava/io/InputStream;ILit/sephiroth/android/library/exif2/ExifInterface;)Lit/sephiroth/android/library/exif2/ExifParser;

    move-result-object v4

    .line 46
    .local v4, "parser":Lit/sephiroth/android/library/exif2/ExifParser;
    new-instance v2, Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v7

    invoke-direct {v2, v7}, Lit/sephiroth/android/library/exif2/ExifData;-><init>(Ljava/nio/ByteOrder;)V

    .line 47
    .local v2, "exifData":Lit/sephiroth/android/library/exif2/ExifData;
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getSections()Ljava/util/List;

    move-result-object v7

    invoke-virtual {v2, v7}, Lit/sephiroth/android/library/exif2/ExifData;->setSections(Ljava/util/List;)V

    .line 48
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getUncompressedDataPosition()I

    move-result v7

    iput v7, v2, Lit/sephiroth/android/library/exif2/ExifData;->mUncompressedDataPosition:I

    .line 50
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getQualityGuess()I

    move-result v7

    invoke-virtual {v2, v7}, Lit/sephiroth/android/library/exif2/ExifData;->setQualityGuess(I)V

    .line 51
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getJpegProcess()S

    move-result v7

    invoke-virtual {v2, v7}, Lit/sephiroth/android/library/exif2/ExifData;->setJpegProcess(S)V

    .line 53
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getImageWidth()I

    move-result v6

    .line 54
    .local v6, "w":I
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getImageLength()I

    move-result v3

    .line 56
    .local v3, "h":I
    if-lez v6, :cond_39

    if-lez v3, :cond_39

    .line 57
    invoke-virtual {v2, v6, v3}, Lit/sephiroth/android/library/exif2/ExifData;->setImageSize(II)V

    .line 62
    :cond_39
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->next()I

    move-result v1

    .line 63
    .local v1, "event":I
    :goto_3d
    const/4 v7, 0x5

    if-eq v1, v7, :cond_e9

    .line 64
    packed-switch v1, :pswitch_data_ea

    .line 112
    :goto_43
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->next()I

    move-result v1

    goto :goto_3d

    .line 66
    :pswitch_48
    new-instance v7, Lit/sephiroth/android/library/exif2/IfdData;

    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getCurrentIfd()I

    move-result v8

    invoke-direct {v7, v8}, Lit/sephiroth/android/library/exif2/IfdData;-><init>(I)V

    invoke-virtual {v2, v7}, Lit/sephiroth/android/library/exif2/ExifData;->addIfdData(Lit/sephiroth/android/library/exif2/IfdData;)V

    goto :goto_43

    .line 69
    :pswitch_55
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getTag()Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v5

    .line 73
    .local v5, "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->hasValue()Z

    move-result v7

    if-nez v7, :cond_63

    .line 74
    invoke-virtual {v4, v5}, Lit/sephiroth/android/library/exif2/ExifParser;->registerForTagValue(Lit/sephiroth/android/library/exif2/ExifTag;)V

    goto :goto_43

    .line 78
    :cond_63
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getIfd()I

    move-result v7

    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getTagId()S

    move-result v8

    invoke-virtual {v4, v7, v8}, Lit/sephiroth/android/library/exif2/ExifParser;->isDefinedTag(II)Z

    move-result v7

    if-eqz v7, :cond_7d

    .line 79
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getIfd()I

    move-result v7

    invoke-virtual {v2, v7}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v7

    invoke-virtual {v7, v5}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    goto :goto_43

    .line 82
    :cond_7d
    const-string v7, "ExifReader"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "skip tag because not registered in the tag table:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_43

    .line 87
    .end local v5    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    :pswitch_96
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getTag()Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v5

    .line 88
    .restart local v5    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataType()S

    move-result v7

    const/4 v8, 0x7

    if-ne v7, v8, :cond_a4

    .line 89
    invoke-virtual {v4, v5}, Lit/sephiroth/android/library/exif2/ExifParser;->readFullTagValue(Lit/sephiroth/android/library/exif2/ExifTag;)V

    .line 91
    :cond_a4
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getIfd()I

    move-result v7

    invoke-virtual {v2, v7}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v7

    invoke-virtual {v7, v5}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    goto :goto_43

    .line 94
    .end local v5    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    :pswitch_b0
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getCompressedImageSize()I

    move-result v7

    new-array v0, v7, [B

    .line 95
    .local v0, "buf":[B
    array-length v7, v0

    invoke-virtual {v4, v0}, Lit/sephiroth/android/library/exif2/ExifParser;->read([B)I

    move-result v8

    if-ne v7, v8, :cond_c1

    .line 96
    invoke-virtual {v2, v0}, Lit/sephiroth/android/library/exif2/ExifData;->setCompressedThumbnail([B)V

    goto :goto_43

    .line 99
    :cond_c1
    const-string v7, "ExifReader"

    const-string v8, "Failed to read the compressed thumbnail"

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_43

    .line 103
    .end local v0    # "buf":[B
    :pswitch_ca
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getStripSize()I

    move-result v7

    new-array v0, v7, [B

    .line 104
    .restart local v0    # "buf":[B
    array-length v7, v0

    invoke-virtual {v4, v0}, Lit/sephiroth/android/library/exif2/ExifParser;->read([B)I

    move-result v8

    if-ne v7, v8, :cond_e0

    .line 105
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifParser;->getStripIndex()I

    move-result v7

    invoke-virtual {v2, v7, v0}, Lit/sephiroth/android/library/exif2/ExifData;->setStripBytes(I[B)V

    goto/16 :goto_43

    .line 108
    :cond_e0
    const-string v7, "ExifReader"

    const-string v8, "Failed to read the strip bytes"

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_43

    .line 114
    .end local v0    # "buf":[B
    :cond_e9
    return-object v2

    .line 64
    :pswitch_data_ea
    .packed-switch 0x0
        :pswitch_48
        :pswitch_55
        :pswitch_96
        :pswitch_b0
        :pswitch_ca
    .end packed-switch
.end method
