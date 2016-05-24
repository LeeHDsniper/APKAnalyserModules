.class final enum Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;
.super Ljava/lang/Enum;
.source "BaseLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/widget/BaseLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "UpdateOp"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

.field public static final enum ADD:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

.field public static final enum MOVE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

.field public static final enum REMOVE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

.field public static final enum UPDATE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 129
    new-instance v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    const-string v1, "ADD"

    invoke-direct {v0, v1, v2}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->ADD:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    .line 130
    new-instance v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    const-string v1, "REMOVE"

    invoke-direct {v0, v1, v3}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->REMOVE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    .line 131
    new-instance v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    const-string v1, "UPDATE"

    invoke-direct {v0, v1, v4}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->UPDATE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    .line 132
    new-instance v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    const-string v1, "MOVE"

    invoke-direct {v0, v1, v5}, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->MOVE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    .line 128
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    sget-object v1, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->ADD:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    aput-object v1, v0, v2

    sget-object v1, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->REMOVE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    aput-object v1, v0, v3

    sget-object v1, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->UPDATE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    aput-object v1, v0, v4

    sget-object v1, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->MOVE:Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    aput-object v1, v0, v5

    sput-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->$VALUES:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

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
    .line 128
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 128
    const-class v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    return-object v0
.end method

.method public static values()[Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;
    .registers 1

    .prologue
    .line 128
    sget-object v0, Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->$VALUES:[Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    invoke-virtual {v0}, [Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/lucasr/twowayview/widget/BaseLayoutManager$UpdateOp;

    return-object v0
.end method
