.class public final enum Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;
.super Ljava/lang/Enum;
.source "Cds.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/Cds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ContentType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

.field public static final enum CONTENT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

.field public static final enum DETAIL_IMAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

.field public static final enum FEATURED_IMAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

.field public static final enum MESSAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

.field public static final enum PREVIEW:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 14
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    const-string v1, "PREVIEW"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->PREVIEW:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    const-string v1, "CONTENT"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->CONTENT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    const-string v1, "MESSAGE"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->MESSAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    const-string v1, "DETAIL_IMAGE"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->DETAIL_IMAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    const-string v1, "FEATURED_IMAGE"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->FEATURED_IMAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    .line 13
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->PREVIEW:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->CONTENT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->MESSAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->DETAIL_IMAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->FEATURED_IMAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

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
    .line 13
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 13
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;
    .registers 1

    .prologue
    .line 13
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    return-object v0
.end method
