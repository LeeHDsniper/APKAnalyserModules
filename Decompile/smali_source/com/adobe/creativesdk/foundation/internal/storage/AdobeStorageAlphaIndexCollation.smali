.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;
.super Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;
.source "AdobeStorageAlphaIndexCollation.java"


# instance fields
.field indexTitles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;-><init>()V

    return-void
.end method


# virtual methods
.method public createSectionDataFromMaster(Ljava/util/ArrayList;)Z
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "masterArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    const/4 v7, 0x0

    .line 32
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->sectionDataArray:Ljava/util/ArrayList;

    .line 33
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->indexTitles:Ljava/util/ArrayList;

    .line 35
    if-nez p1, :cond_12

    .line 75
    :goto_11
    return v7

    .line 43
    :cond_12
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_13
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v2, v8, :cond_8f

    .line 45
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 47
    .local v3, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;

    invoke-direct {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;-><init>()V

    .line 48
    .local v5, "sectionData":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;
    iput-object v3, v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->item:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 49
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->name:Ljava/lang/String;

    .line 50
    iput v2, v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->originalIndex:I

    .line 53
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, "firstLetter":Ljava/lang/String;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .local v6, "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->indexTitles:Ljava/util/ArrayList;

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_72

    .line 59
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->sectionDataArray:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    iput v8, v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->sectionNumber:I

    .line 61
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->sectionDataArray:Ljava/util/ArrayList;

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->indexTitles:Ljava/util/ArrayList;

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    :goto_6f
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 67
    :cond_72
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->indexTitles:Ljava/util/ArrayList;

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 68
    .local v1, "i":I
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->sectionDataArray:Ljava/util/ArrayList;

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 69
    .local v4, "section":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    iput v8, v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;->sectionNumber:I

    .line 70
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->sectionDataArray:Ljava/util/ArrayList;

    invoke-virtual {v8, v1, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_6f

    .line 75
    .end local v0    # "firstLetter":Ljava/lang/String;
    .end local v1    # "i":I
    .end local v3    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v4    # "section":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    .end local v5    # "sectionData":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;
    .end local v6    # "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;"
    :cond_8f
    const/4 v7, 0x1

    goto :goto_11
.end method

.method public sectionTitles()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;->indexTitles:Ljava/util/ArrayList;

    return-object v0
.end method
