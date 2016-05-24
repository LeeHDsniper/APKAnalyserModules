.class final enum Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;
.super Ljava/lang/Enum;
.source "BlemishOverlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

.field public static final enum ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

.field public static final enum FIRST:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

.field public static final enum NONE:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

.field public static final enum SECOND:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

.field public static final enum THIRD:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 23
    new-instance v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->NONE:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    .line 24
    new-instance v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    const-string v1, "FIRST"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->FIRST:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    .line 25
    new-instance v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    const-string v1, "SECOND"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->SECOND:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    .line 26
    new-instance v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    const-string v1, "THIRD"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->THIRD:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    const-string v1, "ALL"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    .line 22
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v1, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->NONE:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->FIRST:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->SECOND:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->THIRD:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    aput-object v1, v0, v6

    sput-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->$VALUES:[Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

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
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;
    .registers 1

    .prologue
    .line 22
    sget-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->$VALUES:[Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    return-object v0
.end method
