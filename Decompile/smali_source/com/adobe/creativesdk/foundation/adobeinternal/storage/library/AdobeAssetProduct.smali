.class public final enum Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;
.super Ljava/lang/Enum;
.source "AdobeAssetProduct.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

.field public static final enum AdobeAssetProductComposition:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

.field public static final enum AdobeAssetProductDraw:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

.field public static final enum AdobeAssetProductLibrary:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

.field public static final enum AdobeAssetProductLine:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

.field public static final enum AdobeAssetProductPSMix:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

.field public static final enum AdobeAssetProductSketch:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

.field public static final enum AdobeAssetProductUndefined:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;


# instance fields
.field private _productType:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 10
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    const-string v1, "AdobeAssetProductUndefined"

    invoke-direct {v0, v1, v4, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductUndefined:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    .line 11
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    const-string v1, "AdobeAssetProductDraw"

    invoke-direct {v0, v1, v5, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductDraw:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    .line 12
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    const-string v1, "AdobeAssetProductLibrary"

    invoke-direct {v0, v1, v6, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductLibrary:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    .line 13
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    const-string v1, "AdobeAssetProductLine"

    invoke-direct {v0, v1, v7, v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductLine:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    .line 14
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    const-string v1, "AdobeAssetProductSketch"

    invoke-direct {v0, v1, v8, v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductSketch:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    .line 15
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    const-string v1, "AdobeAssetProductPSMix"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductPSMix:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    .line 16
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    const-string v1, "AdobeAssetProductComposition"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductComposition:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    .line 8
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductUndefined:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductDraw:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductLibrary:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductLine:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    aput-object v1, v0, v7

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductSketch:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductPSMix:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductComposition:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "productType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 22
    iput p3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->_productType:I

    .line 23
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;
    .registers 1

    .prologue
    .line 8
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    return-object v0
.end method
