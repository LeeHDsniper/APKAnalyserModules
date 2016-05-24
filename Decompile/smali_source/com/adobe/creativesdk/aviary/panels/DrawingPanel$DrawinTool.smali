.class final enum Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
.super Ljava/lang/Enum;
.source "DrawingPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "DrawinTool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

.field public static final enum Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

.field public static final enum Erase:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

.field public static final enum Zoom:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 60
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    const-string v1, "Draw"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    const-string v1, "Erase"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Erase:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    const-string v1, "Zoom"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Zoom:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    .line 59
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Erase:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Zoom:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->$VALUES:[Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

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
    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 59
    const-class v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    .registers 1

    .prologue
    .line 59
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->$VALUES:[Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    return-object v0
.end method
