.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;
.super Ljava/lang/Enum;
.source "AdobePhotoErrorCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

.field public static final enum ADOBE_PHOTO_ERROR_CONFLICTING_CHANGES:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

.field public static final enum ADOBE_PHOTO_ERROR_EXCEEDED_QUOTA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

.field public static final enum ADOBE_PHOTO_ERROR_FILE_READ_FAILURE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

.field public static final enum ADOBE_PHOTO_ERROR_FILE_WRITE_FAILURE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

.field public static final enum ADOBE_PHOTO_ERROR_MISSING_JSON_DATA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

.field public static final enum ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

.field public static final enum ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

.field public static final enum ADOBE_PHOTO_ERROR_UNSUPPORTED_MEDIA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 38
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v1, "ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .line 46
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v1, "ADOBE_PHOTO_ERROR_CONFLICTING_CHANGES"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_CONFLICTING_CHANGES:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .line 53
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v1, "ADOBE_PHOTO_ERROR_FILE_READ_FAILURE"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_FILE_READ_FAILURE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .line 60
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v1, "ADOBE_PHOTO_ERROR_FILE_WRITE_FAILURE"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_FILE_WRITE_FAILURE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .line 65
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v1, "ADOBE_PHOTO_ERROR_EXCEEDED_QUOTA"

    invoke-direct {v0, v1, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_EXCEEDED_QUOTA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .line 70
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v1, "ADOBE_PHOTO_ERROR_MISSING_JSON_DATA"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_MISSING_JSON_DATA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .line 76
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v1, "ADOBE_PHOTO_ERROR_UNSUPPORTED_MEDIA"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNSUPPORTED_MEDIA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .line 83
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v1, "ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .line 25
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_CONFLICTING_CHANGES:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_FILE_READ_FAILURE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_FILE_WRITE_FAILURE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_EXCEEDED_QUOTA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_MISSING_JSON_DATA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNSUPPORTED_MEDIA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

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
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 25
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    return-object v0
.end method
