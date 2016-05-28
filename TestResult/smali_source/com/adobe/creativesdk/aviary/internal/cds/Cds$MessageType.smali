.class public final enum Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;
.super Ljava/lang/Enum;
.source "Cds.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/Cds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MessageType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

.field public static final enum LAUNCH:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 10
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    const-string v1, "LAUNCH"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->LAUNCH:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    .line 9
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->LAUNCH:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    aput-object v1, v0, v2

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

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
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 9
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;
    .registers 1

    .prologue
    .line 9
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->$VALUES:[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    return-object v0
.end method
