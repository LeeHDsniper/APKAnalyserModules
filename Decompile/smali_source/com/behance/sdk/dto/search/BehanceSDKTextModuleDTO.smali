.class public Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;
.super Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
.source "BehanceSDKTextModuleDTO.java"


# static fields
.field private static final serialVersionUID:J = 0x12949024f41a597fL


# instance fields
.field private formattedText:Ljava/lang/String;

.field private plainText:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;-><init>()V

    .line 36
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->TEXT:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;->setType(Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;)V

    .line 37
    return-void
.end method


# virtual methods
.method public setFormattedText(Ljava/lang/String;)V
    .registers 2
    .param p1, "formattedText"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;->formattedText:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setPlainText(Ljava/lang/String;)V
    .registers 2
    .param p1, "plainText"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;->plainText:Ljava/lang/String;

    .line 53
    return-void
.end method
