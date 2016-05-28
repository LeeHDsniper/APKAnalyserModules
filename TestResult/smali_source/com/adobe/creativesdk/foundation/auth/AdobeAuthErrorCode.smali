.class public final enum Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
.super Ljava/lang/Enum;
.source "AdobeAuthErrorCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_AUTH_MODULE_NOT_INITIALIZED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_CLIENT_SECRET_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_INVALID_ARGUMENT:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_NETWORK_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_NO_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_OFFLINE:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_USERNAME_AND_PASSWORD_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_USER_CREDENTIALS_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field public static final enum ADOBE_AUTH_ERROR_CODE_USER_NOT_ENTITLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

.field private static _map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v1, 0x0

    .line 30
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_AUTH_MODULE_NOT_INITIALIZED"

    invoke-direct {v2, v3, v1, v6}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_AUTH_MODULE_NOT_INITIALIZED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 32
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_OFFLINE"

    invoke-direct {v2, v3, v6, v7}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_OFFLINE:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 34
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_NO_ERROR"

    invoke-direct {v2, v3, v7, v8}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_NO_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 36
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_USER_CANCELLED"

    invoke-direct {v2, v3, v8, v9}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 38
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED"

    const/4 v4, 0x5

    invoke-direct {v2, v3, v9, v4}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 40
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_USERNAME_AND_PASSWORD_REQUIRED"

    const/4 v4, 0x5

    const/4 v5, 0x6

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USERNAME_AND_PASSWORD_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 42
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED"

    const/4 v4, 0x6

    const/4 v5, 0x7

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 44
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED"

    const/4 v4, 0x7

    const/16 v5, 0x8

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 46
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_CLIENT_SECRET_REQUIRED"

    const/16 v4, 0x8

    const/16 v5, 0x9

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_CLIENT_SECRET_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 48
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_INVALID_ARGUMENT"

    const/16 v4, 0x9

    const/16 v5, 0xa

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_INVALID_ARGUMENT:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 50
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR"

    const/16 v4, 0xa

    const/16 v5, 0xb

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 52
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_NETWORK_ERROR"

    const/16 v4, 0xb

    const/16 v5, 0xc

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_NETWORK_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 54
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_USER_NOT_ENTITLED"

    const/16 v4, 0xc

    const/16 v5, 0xd

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_NOT_ENTITLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 56
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    const-string v3, "ADOBE_AUTH_ERROR_CODE_USER_CREDENTIALS_REQUIRED"

    const/16 v4, 0xd

    const/16 v5, 0xe

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CREDENTIALS_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 27
    const/16 v2, 0xe

    new-array v2, v2, [Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    sget-object v3, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_AUTH_MODULE_NOT_INITIALIZED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v3, v2, v1

    sget-object v3, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_OFFLINE:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v3, v2, v6

    sget-object v3, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_NO_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v3, v2, v7

    sget-object v3, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v3, v2, v8

    sget-object v3, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_INTERACTION_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v3, v2, v9

    const/4 v3, 0x5

    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USERNAME_AND_PASSWORD_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    const/4 v3, 0x6

    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    const/4 v3, 0x7

    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    const/16 v3, 0x8

    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_CLIENT_SECRET_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    const/16 v3, 0x9

    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_INVALID_ARGUMENT:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    const/16 v3, 0xa

    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    const/16 v3, 0xb

    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_NETWORK_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    const/16 v3, 0xc

    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_NOT_ENTITLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    const/16 v3, 0xd

    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CREDENTIALS_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    aput-object v4, v2, v3

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->$VALUES:[Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 60
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->_map:Ljava/util/Map;

    .line 64
    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->values()[Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v2

    array-length v3, v2

    .local v0, "code":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
    :goto_fc
    if-ge v1, v3, :cond_10e

    aget-object v0, v2, v1

    .line 66
    sget-object v4, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->_map:Ljava/util/Map;

    iget v5, v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->value:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    add-int/lit8 v1, v1, 0x1

    goto :goto_fc

    .line 68
    :cond_10e
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 72
    iput p3, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->value:I

    .line 73
    return-void
.end method

.method static fromInt(I)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
    .registers 3
    .param p0, "value"    # I

    .prologue
    .line 82
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->_map:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 27
    const-class v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
    .registers 1

    .prologue
    .line 27
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->$VALUES:[Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .registers 2

    .prologue
    .line 77
    iget v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->value:I

    return v0
.end method
