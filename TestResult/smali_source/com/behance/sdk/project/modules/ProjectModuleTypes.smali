.class public final enum Lcom/behance/sdk/project/modules/ProjectModuleTypes;
.super Ljava/lang/Enum;
.source "ProjectModuleTypes.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/project/modules/ProjectModuleTypes;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/project/modules/ProjectModuleTypes;

.field public static final enum CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

.field public static final enum EMBED:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

.field public static final enum IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

.field public static final enum TEXT:Lcom/behance/sdk/project/modules/ProjectModuleTypes;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    const-string v1, "IMAGE"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    new-instance v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    const-string v1, "EMBED"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->EMBED:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    new-instance v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    const-string v1, "TEXT"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->TEXT:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    new-instance v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    const-string v1, "CREATIVECLOUD_ASSET"

    invoke-direct {v0, v1, v5}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    .line 24
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->EMBED:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->TEXT:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    aput-object v1, v0, v4

    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    aput-object v1, v0, v5

    sput-object v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->$VALUES:[Lcom/behance/sdk/project/modules/ProjectModuleTypes;

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
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->$VALUES:[Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-virtual {v0}, [Lcom/behance/sdk/project/modules/ProjectModuleTypes;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    return-object v0
.end method
