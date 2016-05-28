.class Lit/sephiroth/android/library/exif2/ExifOutputStream;
.super Ljava/lang/Object;
.source "ExifOutputStream.java"


# instance fields
.field private mBuffer:Ljava/nio/ByteBuffer;

.field private mExifData:Lit/sephiroth/android/library/exif2/ExifData;

.field private final mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;


# direct methods
.method protected constructor <init>(Lit/sephiroth/android/library/exif2/ExifInterface;)V
    .registers 3
    .param p1, "iRef"    # Lit/sephiroth/android/library/exif2/ExifInterface;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    .line 45
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    .line 46
    return-void
.end method

.method private calculateAllOffset()I
    .registers 13

    .prologue
    .line 298
    const/16 v6, 0x8

    .line 299
    .local v6, "offset":I
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v3

    .line 300
    .local v3, "ifd0":Lit/sephiroth/android/library/exif2/IfdData;
    invoke-direct {p0, v3, v6}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->calculateOffsetOfIfd(Lit/sephiroth/android/library/exif2/IfdData;I)I

    move-result v6

    .line 301
    sget v9, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_EXIF_IFD:I

    invoke-static {v9}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v3, v9}, Lit/sephiroth/android/library/exif2/IfdData;->getTag(S)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(I)Z

    .line 303
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v0

    .line 304
    .local v0, "exifIfd":Lit/sephiroth/android/library/exif2/IfdData;
    invoke-direct {p0, v0, v6}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->calculateOffsetOfIfd(Lit/sephiroth/android/library/exif2/IfdData;I)I

    move-result v6

    .line 306
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/4 v10, 0x3

    invoke-virtual {v9, v10}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v5

    .line 307
    .local v5, "interIfd":Lit/sephiroth/android/library/exif2/IfdData;
    if-eqz v5, :cond_3f

    .line 308
    sget v9, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-static {v9}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v0, v9}, Lit/sephiroth/android/library/exif2/IfdData;->getTag(S)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(I)Z

    .line 309
    invoke-direct {p0, v5, v6}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->calculateOffsetOfIfd(Lit/sephiroth/android/library/exif2/IfdData;I)I

    move-result v6

    .line 312
    :cond_3f
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v1

    .line 313
    .local v1, "gpsIfd":Lit/sephiroth/android/library/exif2/IfdData;
    if-eqz v1, :cond_59

    .line 314
    sget v9, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_GPS_IFD:I

    invoke-static {v9}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v3, v9}, Lit/sephiroth/android/library/exif2/IfdData;->getTag(S)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(I)Z

    .line 315
    invoke-direct {p0, v1, v6}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->calculateOffsetOfIfd(Lit/sephiroth/android/library/exif2/IfdData;I)I

    move-result v6

    .line 318
    :cond_59
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v4

    .line 319
    .local v4, "ifd1":Lit/sephiroth/android/library/exif2/IfdData;
    if-eqz v4, :cond_69

    .line 320
    invoke-virtual {v3, v6}, Lit/sephiroth/android/library/exif2/IfdData;->setOffsetToNextIfd(I)V

    .line 321
    invoke-direct {p0, v4, v6}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->calculateOffsetOfIfd(Lit/sephiroth/android/library/exif2/IfdData;I)I

    move-result v6

    .line 325
    :cond_69
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v9}, Lit/sephiroth/android/library/exif2/ExifData;->hasCompressedThumbnail()Z

    move-result v9

    if-eqz v9, :cond_87

    .line 326
    sget v9, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v9}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v4, v9}, Lit/sephiroth/android/library/exif2/IfdData;->getTag(S)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(I)Z

    .line 327
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v9}, Lit/sephiroth/android/library/exif2/ExifData;->getCompressedThumbnail()[B

    move-result-object v9

    array-length v9, v9

    add-int/2addr v6, v9

    .line 338
    :cond_86
    :goto_86
    return v6

    .line 329
    :cond_87
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v9}, Lit/sephiroth/android/library/exif2/ExifData;->hasUncompressedStrip()Z

    move-result v9

    if-eqz v9, :cond_86

    .line 330
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v9}, Lit/sephiroth/android/library/exif2/ExifData;->getStripCount()I

    move-result v8

    .line 331
    .local v8, "stripCount":I
    new-array v7, v8, [J

    .line 332
    .local v7, "offsets":[J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_98
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v9}, Lit/sephiroth/android/library/exif2/ExifData;->getStripCount()I

    move-result v9

    if-ge v2, v9, :cond_ae

    .line 333
    int-to-long v10, v6

    aput-wide v10, v7, v2

    .line 334
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v9, v2}, Lit/sephiroth/android/library/exif2/ExifData;->getStrip(I)[B

    move-result-object v9

    array-length v9, v9

    add-int/2addr v6, v9

    .line 332
    add-int/lit8 v2, v2, 0x1

    goto :goto_98

    .line 336
    :cond_ae
    sget v9, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v9}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v4, v9}, Lit/sephiroth/android/library/exif2/IfdData;->getTag(S)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v7}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([J)Z

    goto :goto_86
.end method

.method private calculateOffsetOfIfd(Lit/sephiroth/android/library/exif2/IfdData;I)I
    .registers 10
    .param p1, "ifd"    # Lit/sephiroth/android/library/exif2/IfdData;
    .param p2, "offset"    # I

    .prologue
    .line 184
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/IfdData;->getTagCount()I

    move-result v5

    mul-int/lit8 v5, v5, 0xc

    add-int/lit8 v5, v5, 0x2

    add-int/lit8 v5, v5, 0x4

    add-int/2addr p2, v5

    .line 185
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/IfdData;->getAllTags()[Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v4

    .line 186
    .local v4, "tags":[Lit/sephiroth/android/library/exif2/ExifTag;
    move-object v0, v4

    .local v0, "arr$":[Lit/sephiroth/android/library/exif2/ExifTag;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_12
    if-ge v1, v2, :cond_28

    aget-object v3, v0, v1

    .line 187
    .local v3, "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataSize()I

    move-result v5

    const/4 v6, 0x4

    if-le v5, v6, :cond_25

    .line 188
    invoke-virtual {v3, p2}, Lit/sephiroth/android/library/exif2/ExifTag;->setOffset(I)V

    .line 189
    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataSize()I

    move-result v5

    add-int/2addr p2, v5

    .line 186
    :cond_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 192
    .end local v3    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_28
    return p2
.end method

.method private createRequiredIfdAndTag()V
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v7

    .line 198
    .local v7, "ifd0":Lit/sephiroth/android/library/exif2/IfdData;
    if-nez v7, :cond_19

    .line 199
    new-instance v7, Lit/sephiroth/android/library/exif2/IfdData;

    .end local v7    # "ifd0":Lit/sephiroth/android/library/exif2/IfdData;
    const/4 v15, 0x0

    invoke-direct {v7, v15}, Lit/sephiroth/android/library/exif2/IfdData;-><init>(I)V

    .line 200
    .restart local v7    # "ifd0":Lit/sephiroth/android/library/exif2/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15, v7}, Lit/sephiroth/android/library/exif2/ExifData;->addIfdData(Lit/sephiroth/android/library/exif2/IfdData;)V

    .line 202
    :cond_19
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    sget v16, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_EXIF_IFD:I

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifInterface;->buildUninitializedTag(I)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v3

    .line 203
    .local v3, "exifOffsetTag":Lit/sephiroth/android/library/exif2/ExifTag;
    if-nez v3, :cond_40

    .line 204
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    sget v17, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_EXIF_IFD:I

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 206
    :cond_40
    invoke-virtual {v7, v3}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    .line 209
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v2

    .line 210
    .local v2, "exifIfd":Lit/sephiroth/android/library/exif2/IfdData;
    if-nez v2, :cond_5c

    .line 211
    new-instance v2, Lit/sephiroth/android/library/exif2/IfdData;

    .end local v2    # "exifIfd":Lit/sephiroth/android/library/exif2/IfdData;
    const/4 v15, 0x2

    invoke-direct {v2, v15}, Lit/sephiroth/android/library/exif2/IfdData;-><init>(I)V

    .line 212
    .restart local v2    # "exifIfd":Lit/sephiroth/android/library/exif2/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15, v2}, Lit/sephiroth/android/library/exif2/ExifData;->addIfdData(Lit/sephiroth/android/library/exif2/IfdData;)V

    .line 216
    :cond_5c
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/16 v16, 0x4

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v4

    .line 217
    .local v4, "gpsIfd":Lit/sephiroth/android/library/exif2/IfdData;
    if-eqz v4, :cond_92

    .line 218
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    sget v16, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_GPS_IFD:I

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifInterface;->buildUninitializedTag(I)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v5

    .line 219
    .local v5, "gpsOffsetTag":Lit/sephiroth/android/library/exif2/ExifTag;
    if-nez v5, :cond_8f

    .line 220
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    sget v17, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_GPS_IFD:I

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 222
    :cond_8f
    invoke-virtual {v7, v5}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    .line 226
    .end local v5    # "gpsOffsetTag":Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_92
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/16 v16, 0x3

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v9

    .line 227
    .local v9, "interIfd":Lit/sephiroth/android/library/exif2/IfdData;
    if-eqz v9, :cond_c8

    .line 228
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    sget v16, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifInterface;->buildUninitializedTag(I)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v10

    .line 229
    .local v10, "interOffsetTag":Lit/sephiroth/android/library/exif2/ExifTag;
    if-nez v10, :cond_c5

    .line 230
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    sget v17, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 232
    :cond_c5
    invoke-virtual {v2, v10}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    .line 235
    .end local v10    # "interOffsetTag":Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_c8
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/16 v16, 0x1

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v8

    .line 238
    .local v8, "ifd1":Lit/sephiroth/android/library/exif2/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15}, Lit/sephiroth/android/library/exif2/ExifData;->hasCompressedThumbnail()Z

    move-result v15

    if-eqz v15, :cond_15e

    .line 240
    if-nez v8, :cond_eb

    .line 241
    new-instance v8, Lit/sephiroth/android/library/exif2/IfdData;

    .end local v8    # "ifd1":Lit/sephiroth/android/library/exif2/IfdData;
    const/4 v15, 0x1

    invoke-direct {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;-><init>(I)V

    .line 242
    .restart local v8    # "ifd1":Lit/sephiroth/android/library/exif2/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15, v8}, Lit/sephiroth/android/library/exif2/ExifData;->addIfdData(Lit/sephiroth/android/library/exif2/IfdData;)V

    .line 245
    :cond_eb
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    sget v16, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifInterface;->buildUninitializedTag(I)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v13

    .line 246
    .local v13, "offsetTag":Lit/sephiroth/android/library/exif2/ExifTag;
    if-nez v13, :cond_112

    .line 247
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    sget v17, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 250
    :cond_112
    invoke-virtual {v8, v13}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    .line 251
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    sget v16, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifInterface;->buildUninitializedTag(I)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v11

    .line 252
    .local v11, "lengthTag":Lit/sephiroth/android/library/exif2/ExifTag;
    if-nez v11, :cond_13c

    .line 253
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    sget v17, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 256
    :cond_13c
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15}, Lit/sephiroth/android/library/exif2/ExifData;->getCompressedThumbnail()[B

    move-result-object v15

    array-length v15, v15

    invoke-virtual {v11, v15}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(I)Z

    .line 257
    invoke-virtual {v8, v11}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    .line 260
    sget v15, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v15}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;->removeTag(S)V

    .line 261
    sget v15, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-static {v15}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;->removeTag(S)V

    .line 295
    .end local v11    # "lengthTag":Lit/sephiroth/android/library/exif2/ExifTag;
    .end local v13    # "offsetTag":Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_15d
    :goto_15d
    return-void

    .line 263
    :cond_15e
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15}, Lit/sephiroth/android/library/exif2/ExifData;->hasUncompressedStrip()Z

    move-result v15

    if-eqz v15, :cond_208

    .line 264
    if-nez v8, :cond_177

    .line 265
    new-instance v8, Lit/sephiroth/android/library/exif2/IfdData;

    .end local v8    # "ifd1":Lit/sephiroth/android/library/exif2/IfdData;
    const/4 v15, 0x1

    invoke-direct {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;-><init>(I)V

    .line 266
    .restart local v8    # "ifd1":Lit/sephiroth/android/library/exif2/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15, v8}, Lit/sephiroth/android/library/exif2/ExifData;->addIfdData(Lit/sephiroth/android/library/exif2/IfdData;)V

    .line 268
    :cond_177
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15}, Lit/sephiroth/android/library/exif2/ExifData;->getStripCount()I

    move-result v14

    .line 269
    .local v14, "stripCount":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    sget v16, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifInterface;->buildUninitializedTag(I)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v13

    .line 270
    .restart local v13    # "offsetTag":Lit/sephiroth/android/library/exif2/ExifTag;
    if-nez v13, :cond_1a6

    .line 271
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    sget v17, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 273
    :cond_1a6
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    sget v16, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-virtual/range {v15 .. v16}, Lit/sephiroth/android/library/exif2/ExifInterface;->buildUninitializedTag(I)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v11

    .line 274
    .restart local v11    # "lengthTag":Lit/sephiroth/android/library/exif2/ExifTag;
    if-nez v11, :cond_1cd

    .line 275
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    sget v17, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 277
    :cond_1cd
    new-array v12, v14, [J

    .line 278
    .local v12, "lengths":[J
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1d0
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15}, Lit/sephiroth/android/library/exif2/ExifData;->getStripCount()I

    move-result v15

    if-ge v6, v15, :cond_1eb

    .line 279
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v15, v6}, Lit/sephiroth/android/library/exif2/ExifData;->getStrip(I)[B

    move-result-object v15

    array-length v15, v15

    int-to-long v0, v15

    move-wide/from16 v16, v0

    aput-wide v16, v12, v6

    .line 278
    add-int/lit8 v6, v6, 0x1

    goto :goto_1d0

    .line 281
    :cond_1eb
    invoke-virtual {v11, v12}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([J)Z

    .line 282
    invoke-virtual {v8, v13}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    .line 283
    invoke-virtual {v8, v11}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    .line 285
    sget v15, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v15}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;->removeTag(S)V

    .line 286
    sget v15, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-static {v15}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;->removeTag(S)V

    goto/16 :goto_15d

    .line 288
    .end local v6    # "i":I
    .end local v11    # "lengthTag":Lit/sephiroth/android/library/exif2/ExifTag;
    .end local v12    # "lengths":[J
    .end local v13    # "offsetTag":Lit/sephiroth/android/library/exif2/ExifTag;
    .end local v14    # "stripCount":I
    :cond_208
    if-eqz v8, :cond_15d

    .line 290
    sget v15, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v15}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;->removeTag(S)V

    .line 291
    sget v15, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-static {v15}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;->removeTag(S)V

    .line 292
    sget v15, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v15}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;->removeTag(S)V

    .line 293
    sget v15, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-static {v15}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lit/sephiroth/android/library/exif2/IfdData;->removeTag(S)V

    goto/16 :goto_15d
.end method

.method private stripNullValueTags(Lit/sephiroth/android/library/exif2/ExifData;)Ljava/util/ArrayList;
    .registers 7
    .param p1, "data"    # Lit/sephiroth/android/library/exif2/ExifData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lit/sephiroth/android/library/exif2/ExifData;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lit/sephiroth/android/library/exif2/ExifTag;",
            ">;"
        }
    .end annotation

    .prologue
    .line 117
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 118
    .local v1, "nullTags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lit/sephiroth/android/library/exif2/ExifTag;>;"
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifData;->getAllTags()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_38

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lit/sephiroth/android/library/exif2/ExifTag;

    .line 119
    .local v2, "t":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v2}, Lit/sephiroth/android/library/exif2/ExifTag;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_d

    invoke-virtual {v2}, Lit/sephiroth/android/library/exif2/ExifTag;->getTagId()S

    move-result v3

    invoke-static {v3}, Lit/sephiroth/android/library/exif2/ExifInterface;->isOffsetTag(S)Z

    move-result v3

    if-nez v3, :cond_d

    .line 120
    invoke-virtual {v2}, Lit/sephiroth/android/library/exif2/ExifTag;->getTagId()S

    move-result v3

    invoke-virtual {v2}, Lit/sephiroth/android/library/exif2/ExifTag;->getIfd()I

    move-result v4

    invoke-virtual {p1, v3, v4}, Lit/sephiroth/android/library/exif2/ExifData;->removeTag(SI)V

    .line 121
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 124
    .end local v2    # "t":Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_38
    return-object v1
.end method

.method private writeAllTags(Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V
    .registers 8
    .param p1, "dataOutputStream"    # Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 141
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->writeIfd(Lit/sephiroth/android/library/exif2/IfdData;Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V

    .line 142
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->writeIfd(Lit/sephiroth/android/library/exif2/IfdData;Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V

    .line 143
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v2

    .line 144
    .local v2, "interoperabilityIfd":Lit/sephiroth/android/library/exif2/IfdData;
    if-eqz v2, :cond_21

    .line 145
    invoke-direct {p0, v2, p1}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->writeIfd(Lit/sephiroth/android/library/exif2/IfdData;Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V

    .line 147
    :cond_21
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v0

    .line 148
    .local v0, "gpsIfd":Lit/sephiroth/android/library/exif2/IfdData;
    if-eqz v0, :cond_2d

    .line 149
    invoke-direct {p0, v0, p1}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->writeIfd(Lit/sephiroth/android/library/exif2/IfdData;Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V

    .line 151
    :cond_2d
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v3, v5}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v1

    .line 152
    .local v1, "ifd1":Lit/sephiroth/android/library/exif2/IfdData;
    if-eqz v1, :cond_3e

    .line 153
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v3, v5}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->writeIfd(Lit/sephiroth/android/library/exif2/IfdData;Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V

    .line 155
    :cond_3e
    return-void
.end method

.method private writeIfd(Lit/sephiroth/android/library/exif2/IfdData;Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V
    .registers 12
    .param p1, "ifd"    # Lit/sephiroth/android/library/exif2/IfdData;
    .param p2, "dataOutputStream"    # Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 158
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/IfdData;->getAllTags()[Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v6

    .line 159
    .local v6, "tags":[Lit/sephiroth/android/library/exif2/ExifTag;
    array-length v7, v6

    int-to-short v7, v7

    invoke-virtual {p2, v7}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 160
    move-object v0, v6

    .local v0, "arr$":[Lit/sephiroth/android/library/exif2/ExifTag;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_d
    if-ge v2, v3, :cond_49

    aget-object v5, v0, v2

    .line 161
    .local v5, "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getTagId()S

    move-result v7

    invoke-virtual {p2, v7}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 162
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataType()S

    move-result v7

    invoke-virtual {p2, v7}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 163
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v7

    invoke-virtual {p2, v7}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeInt(I)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 165
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataSize()I

    move-result v7

    if-le v7, v8, :cond_36

    .line 166
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getOffset()I

    move-result v7

    invoke-virtual {p2, v7}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeInt(I)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 160
    :cond_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 169
    :cond_36
    invoke-static {v5, p2}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->writeTagValue(Lit/sephiroth/android/library/exif2/ExifTag;Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V

    .line 170
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataSize()I

    move-result v7

    rsub-int/lit8 v4, v7, 0x4

    .local v4, "n":I
    :goto_40
    if-ge v1, v4, :cond_33

    .line 171
    const/4 v7, 0x0

    invoke-virtual {p2, v7}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->write(I)V

    .line 170
    add-int/lit8 v1, v1, 0x1

    goto :goto_40

    .line 175
    .end local v1    # "i":I
    .end local v4    # "n":I
    .end local v5    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_49
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/IfdData;->getOffsetToNextIfd()I

    move-result v7

    invoke-virtual {p2, v7}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeInt(I)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 176
    move-object v0, v6

    array-length v3, v0

    const/4 v2, 0x0

    :goto_53
    if-ge v2, v3, :cond_63

    aget-object v5, v0, v2

    .line 177
    .restart local v5    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v5}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataSize()I

    move-result v7

    if-le v7, v8, :cond_60

    .line 178
    invoke-static {v5, p2}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->writeTagValue(Lit/sephiroth/android/library/exif2/ExifTag;Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V

    .line 176
    :cond_60
    add-int/lit8 v2, v2, 0x1

    goto :goto_53

    .line 181
    .end local v5    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_63
    return-void
.end method

.method static writeTagValue(Lit/sephiroth/android/library/exif2/ExifTag;Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V
    .registers 8
    .param p0, "tag"    # Lit/sephiroth/android/library/exif2/ExifTag;
    .param p1, "dataOutputStream"    # Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 342
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataType()S

    move-result v3

    packed-switch v3, :pswitch_data_68

    .line 378
    :cond_8
    :goto_8
    :pswitch_8
    return-void

    .line 344
    :pswitch_9
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->getStringByte()[B

    move-result-object v0

    .line 345
    .local v0, "buf":[B
    array-length v3, v0

    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v4

    if-ne v3, v4, :cond_1d

    .line 346
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aput-byte v5, v0, v3

    .line 347
    invoke-virtual {p1, v0}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->write([B)V

    goto :goto_8

    .line 350
    :cond_1d
    invoke-virtual {p1, v0}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->write([B)V

    .line 351
    invoke-virtual {p1, v5}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->write(I)V

    goto :goto_8

    .line 356
    .end local v0    # "buf":[B
    :pswitch_24
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v2

    .local v2, "n":I
    :goto_29
    if-ge v1, v2, :cond_8

    .line 357
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v4

    long-to-int v3, v4

    invoke-virtual {p1, v3}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeInt(I)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 356
    add-int/lit8 v1, v1, 0x1

    goto :goto_29

    .line 362
    .end local v1    # "i":I
    .end local v2    # "n":I
    :pswitch_36
    const/4 v1, 0x0

    .restart local v1    # "i":I
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v2

    .restart local v2    # "n":I
    :goto_3b
    if-ge v1, v2, :cond_8

    .line 363
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->getRational(I)Lit/sephiroth/android/library/exif2/Rational;

    move-result-object v3

    invoke-virtual {p1, v3}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeRational(Lit/sephiroth/android/library/exif2/Rational;)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 362
    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    .line 368
    .end local v1    # "i":I
    .end local v2    # "n":I
    :pswitch_47
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v3

    new-array v0, v3, [B

    .line 369
    .restart local v0    # "buf":[B
    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->getBytes([B)V

    .line 370
    invoke-virtual {p1, v0}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->write([B)V

    goto :goto_8

    .line 373
    .end local v0    # "buf":[B
    :pswitch_54
    const/4 v1, 0x0

    .restart local v1    # "i":I
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v2

    .restart local v2    # "n":I
    :goto_59
    if-ge v1, v2, :cond_8

    .line 374
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v4

    long-to-int v3, v4

    int-to-short v3, v3

    invoke-virtual {p1, v3}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 373
    add-int/lit8 v1, v1, 0x1

    goto :goto_59

    .line 342
    nop

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_47
        :pswitch_9
        :pswitch_54
        :pswitch_24
        :pswitch_36
        :pswitch_8
        :pswitch_47
        :pswitch_8
        :pswitch_24
        :pswitch_36
    .end packed-switch
.end method

.method private writeThumbnail(Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V
    .registers 5
    .param p1, "dataOutputStream"    # Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v1}, Lit/sephiroth/android/library/exif2/ExifData;->hasCompressedThumbnail()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 129
    const-string v1, "ExifOutputStream"

    const-string v2, "writing thumbnail.."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v1}, Lit/sephiroth/android/library/exif2/ExifData;->getCompressedThumbnail()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->write([B)V

    .line 138
    :cond_18
    return-void

    .line 132
    :cond_19
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v1}, Lit/sephiroth/android/library/exif2/ExifData;->hasUncompressedStrip()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 133
    const-string v1, "ExifOutputStream"

    const-string v2, "writing uncompressed strip.."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_29
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v1}, Lit/sephiroth/android/library/exif2/ExifData;->getStripCount()I

    move-result v1

    if-ge v0, v1, :cond_18

    .line 135
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v1, v0}, Lit/sephiroth/android/library/exif2/ExifData;->getStrip(I)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->write([B)V

    .line 134
    add-int/lit8 v0, v0, 0x1

    goto :goto_29
.end method


# virtual methods
.method protected setExifData(Lit/sephiroth/android/library/exif2/ExifData;)V
    .registers 2
    .param p1, "exifData"    # Lit/sephiroth/android/library/exif2/ExifData;

    .prologue
    .line 60
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    .line 61
    return-void
.end method

.method public writeExifData(Ljava/io/OutputStream;)V
    .registers 10
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    iget-object v6, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    if-nez v6, :cond_5

    .line 114
    :goto_4
    return-void

    .line 76
    :cond_5
    const-string v6, "ExifOutputStream"

    const-string v7, "Writing exif data..."

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v6, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-direct {p0, v6}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->stripNullValueTags(Lit/sephiroth/android/library/exif2/ExifData;)Ljava/util/ArrayList;

    move-result-object v3

    .line 79
    .local v3, "nullTags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lit/sephiroth/android/library/exif2/ExifTag;>;"
    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->createRequiredIfdAndTag()V

    .line 80
    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->calculateAllOffset()I

    move-result v1

    .line 82
    .local v1, "exifSize":I
    add-int/lit8 v6, v1, 0x8

    const v7, 0xffff

    if-le v6, v7, :cond_28

    .line 83
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Exif header is too large (>64Kb)"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 86
    :cond_28
    new-instance v4, Ljava/io/BufferedOutputStream;

    const/high16 v6, 0x10000

    invoke-direct {v4, p1, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 87
    .local v4, "outputStream":Ljava/io/BufferedOutputStream;
    new-instance v0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    invoke-direct {v0, v4}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 89
    .local v0, "dataOutputStream":Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
    sget-object v6, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->setByteOrder(Ljava/nio/ByteOrder;)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 91
    const/16 v6, 0xff

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->write(I)V

    .line 92
    const/16 v6, 0xe1

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->write(I)V

    .line 93
    add-int/lit8 v6, v1, 0x8

    int-to-short v6, v6

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 94
    const v6, 0x45786966

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeInt(I)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 95
    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 96
    iget-object v6, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v6}, Lit/sephiroth/android/library/exif2/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v6

    sget-object v7, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v6, v7, :cond_91

    .line 97
    const/16 v6, 0x4d4d

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 102
    :goto_62
    iget-object v6, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v6}, Lit/sephiroth/android/library/exif2/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v6

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->setByteOrder(Ljava/nio/ByteOrder;)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 103
    const/16 v6, 0x2a

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 104
    const/16 v6, 0x8

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeInt(I)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 105
    invoke-direct {p0, v0}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->writeAllTags(Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V

    .line 107
    invoke-direct {p0, v0}, Lit/sephiroth/android/library/exif2/ExifOutputStream;->writeThumbnail(Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;)V

    .line 109
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_7f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_97

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lit/sephiroth/android/library/exif2/ExifTag;

    .line 110
    .local v5, "t":Lit/sephiroth/android/library/exif2/ExifTag;
    iget-object v6, p0, Lit/sephiroth/android/library/exif2/ExifOutputStream;->mExifData:Lit/sephiroth/android/library/exif2/ExifData;

    invoke-virtual {v6, v5}, Lit/sephiroth/android/library/exif2/ExifData;->addTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    goto :goto_7f

    .line 100
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v5    # "t":Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_91
    const/16 v6, 0x4949

    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    goto :goto_62

    .line 113
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_97
    invoke-virtual {v0}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->flush()V

    goto/16 :goto_4
.end method
