.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;
.super Ljava/lang/Enum;
.source "AdobePhotoCollection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AdobePhotoCollectionSort"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

.field public static final enum ADOBE_PHOTO_COLLECTION_SORT_BY_CUSTOM_ORDER:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

.field public static final enum ADOBE_PHOTO_COLLECTION_SORT_BY_DATE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 52
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    const-string v1, "ADOBE_PHOTO_COLLECTION_SORT_BY_DATE"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->ADOBE_PHOTO_COLLECTION_SORT_BY_DATE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    .line 54
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    const-string v1, "ADOBE_PHOTO_COLLECTION_SORT_BY_CUSTOM_ORDER"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->ADOBE_PHOTO_COLLECTION_SORT_BY_CUSTOM_ORDER:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    .line 49
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->ADOBE_PHOTO_COLLECTION_SORT_BY_DATE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->ADOBE_PHOTO_COLLECTION_SORT_BY_CUSTOM_ORDER:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 49
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;
    .registers 1

    .prologue
    .line 49
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    return-object v0
.end method
