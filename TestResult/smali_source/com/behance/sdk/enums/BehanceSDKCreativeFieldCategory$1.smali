.class synthetic Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory$1;
.super Ljava/lang/Object;
.source "BehanceSDKCreativeFieldCategory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$behance$sdk$enums$BehanceSDKCreativeFieldCategory:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 45
    invoke-static {}, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->values()[Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory$1;->$SwitchMap$com$behance$sdk$enums$BehanceSDKCreativeFieldCategory:[I

    :try_start_9
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory$1;->$SwitchMap$com$behance$sdk$enums$BehanceSDKCreativeFieldCategory:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->POPULAR:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_15

    :goto_14
    return-void

    :catch_15
    move-exception v0

    goto :goto_14
.end method
