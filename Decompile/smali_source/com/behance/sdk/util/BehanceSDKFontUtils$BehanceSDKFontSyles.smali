.class public final enum Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;
.super Ljava/lang/Enum;
.source "BehanceSDKFontUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/util/BehanceSDKFontUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BehanceSDKFontSyles"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

.field public static final enum BOLD:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

.field public static final enum LIGHT:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

.field public static final enum REGULAR:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 36
    new-instance v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    const-string v1, "REGULAR"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->REGULAR:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    new-instance v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    const-string v1, "BOLD"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->BOLD:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    new-instance v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    const-string v1, "LIGHT"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->LIGHT:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    .line 35
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->REGULAR:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->BOLD:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->LIGHT:Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    aput-object v1, v0, v4

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->$VALUES:[Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

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
    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    const-class v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;
    .registers 1

    .prologue
    .line 35
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->$VALUES:[Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    invoke-virtual {v0}, [Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/util/BehanceSDKFontUtils$BehanceSDKFontSyles;

    return-object v0
.end method
