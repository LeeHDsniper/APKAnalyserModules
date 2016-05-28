.class public final enum Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;
.super Ljava/lang/Enum;
.source "BehanceSDKProjectModuleType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

.field public static final enum AUDIO:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

.field public static final enum EMBED:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

.field public static final enum IMAGE:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

.field public static final enum TEXT:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

.field public static final enum VIDEO:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    const-string v1, "IMAGE"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->IMAGE:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    const-string v1, "TEXT"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->TEXT:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    const-string v1, "EMBED"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->EMBED:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    const-string v1, "AUDIO"

    invoke-direct {v0, v1, v5}, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->AUDIO:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    const-string v1, "VIDEO"

    invoke-direct {v0, v1, v6}, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->VIDEO:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    .line 26
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->IMAGE:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->TEXT:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->EMBED:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->AUDIO:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->VIDEO:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

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
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;
    .registers 6
    .param p0, "moduleTypeStr"    # Ljava/lang/String;

    .prologue
    .line 30
    if-eqz p0, :cond_1a

    .line 31
    invoke-static {}, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->values()[Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_8
    if-ge v1, v3, :cond_1a

    aget-object v0, v2, v1

    .line 32
    .local v0, "value":Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;
    invoke-virtual {v0}, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 37
    .end local v0    # "value":Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;
    :goto_16
    return-object v0

    .line 31
    .restart local v0    # "value":Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 37
    .end local v0    # "value":Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;
    :cond_1a
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;
    .registers 1

    .prologue
    .line 26
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    invoke-virtual {v0}, [Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    return-object v0
.end method
