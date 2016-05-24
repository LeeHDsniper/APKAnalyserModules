.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;
.super Ljava/lang/Enum;
.source "AdobeAssetErrorCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorAuthenticationFailed:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorBadRequest:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorCancelled:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorConflictingChanges:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorExceededQuota:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorFileReadFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorFileWriteFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorNetworkFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorOffline:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorServiceDisconnected:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorTimeout:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorUnsupportedMedia:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetErrorWrongEndpoint:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

.field public static final enum AdobeAssetMissingJSONData:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;


# instance fields
.field private _val:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 31
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorBadRequest"

    invoke-direct {v0, v1, v4, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorBadRequest:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 40
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorNetworkFailure"

    invoke-direct {v0, v1, v5, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorNetworkFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 53
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorUnexpectedResponse"

    invoke-direct {v0, v1, v6, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 61
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorOffline"

    invoke-direct {v0, v1, v7, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorOffline:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 69
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorCancelled"

    invoke-direct {v0, v1, v8, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorCancelled:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 75
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorAuthenticationFailed"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorAuthenticationFailed:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 81
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorServiceDisconnected"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorServiceDisconnected:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 89
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorConflictingChanges"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorConflictingChanges:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 96
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorFileReadFailure"

    const/16 v2, 0x8

    const/16 v3, 0x8

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorFileReadFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 103
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorFileWriteFailure"

    const/16 v2, 0x9

    const/16 v3, 0x9

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorFileWriteFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 108
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorExceededQuota"

    const/16 v2, 0xa

    const/16 v3, 0xa

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorExceededQuota:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 113
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetMissingJSONData"

    const/16 v2, 0xb

    const/16 v3, 0xb

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetMissingJSONData:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 119
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorUnsupportedMedia"

    const/16 v2, 0xc

    const/16 v3, 0xc

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnsupportedMedia:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 125
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorWrongEndpoint"

    const/16 v2, 0xd

    const/16 v3, 0xd

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorWrongEndpoint:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 132
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorNotEntitledToService"

    const/16 v2, 0xe

    const/16 v3, 0xe

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 137
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v1, "AdobeAssetErrorTimeout"

    const/16 v2, 0xf

    const/16 v3, 0xf

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorTimeout:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 20
    const/16 v0, 0x10

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorBadRequest:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorNetworkFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorOffline:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorCancelled:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorAuthenticationFailed:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorServiceDisconnected:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorConflictingChanges:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorFileReadFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorFileWriteFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorExceededQuota:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetMissingJSONData:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnsupportedMedia:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorWrongEndpoint:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorTimeout:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "val"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 140
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 141
    iput p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->_val:I

    .line 142
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;
    .registers 1

    .prologue
    .line 20
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .registers 2

    .prologue
    .line 145
    iget v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->_val:I

    return v0
.end method
