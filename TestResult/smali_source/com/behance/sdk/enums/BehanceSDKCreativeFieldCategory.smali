.class public final enum Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;
.super Ljava/lang/Enum;
.source "BehanceSDKCreativeFieldCategory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

.field public static final enum NONE:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

.field public static final enum POPULAR:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    const-string v1, "POPULAR"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->POPULAR:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->NONE:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    .line 29
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->POPULAR:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->NONE:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    aput-object v1, v0, v3

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

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
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 49
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    invoke-virtual {v0}, [Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    return-object v0
.end method


# virtual methods
.method public getString(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory$1;->$SwitchMap$com$behance$sdk$enums$BehanceSDKCreativeFieldCategory:[I

    invoke-virtual {p0}, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1a

    .line 49
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->NONE:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    invoke-virtual {v0}, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_11
    return-object v0

    .line 47
    :pswitch_12
    sget v0, Lcom/behance/sdk/R$string;->bsdk_addproject_creative_fields_popular_category:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    .line 45
    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_12
    .end packed-switch
.end method
