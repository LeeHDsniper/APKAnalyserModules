.class public final enum Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;
.super Ljava/lang/Enum;
.source "BehanceSDKFontUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/util/BehanceSDKFontUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BehanceSDKCustomFonts"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

.field public static final enum ADOBECLEAN:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 41
    new-instance v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    const-string v1, "ADOBECLEAN"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->ADOBECLEAN:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    .line 40
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->ADOBECLEAN:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    aput-object v1, v0, v2

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->$VALUES:[Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

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
    .line 40
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 40
    const-class v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;
    .registers 1

    .prologue
    .line 40
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->$VALUES:[Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    invoke-virtual {v0}, [Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKCustomFonts;

    return-object v0
.end method
