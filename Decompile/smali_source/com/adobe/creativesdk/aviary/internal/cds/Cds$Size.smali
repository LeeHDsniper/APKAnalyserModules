.class public final enum Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;
.super Ljava/lang/Enum;
.source "Cds.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/Cds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Size"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

.field public static final enum Large:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

.field public static final enum Medium:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

.field public static final enum Small:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 34
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    const-string v1, "Small"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Small:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    const-string v1, "Medium"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Medium:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    const-string v1, "Large"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Large:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    .line 33
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Small:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Medium:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Large:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

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
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    return-object v0
.end method
