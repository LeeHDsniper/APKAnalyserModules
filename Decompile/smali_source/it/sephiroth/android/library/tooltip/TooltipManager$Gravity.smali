.class public final enum Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;
.super Ljava/lang/Enum;
.source "TooltipManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/tooltip/TooltipManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Gravity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

.field public static final enum BOTTOM:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

.field public static final enum CENTER:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

.field public static final enum LEFT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

.field public static final enum RIGHT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

.field public static final enum TOP:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 416
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    const-string v1, "LEFT"

    invoke-direct {v0, v1, v2}, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->LEFT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    const-string v1, "RIGHT"

    invoke-direct {v0, v1, v3}, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->RIGHT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    const-string v1, "TOP"

    invoke-direct {v0, v1, v4}, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->TOP:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    const-string v1, "BOTTOM"

    invoke-direct {v0, v1, v5}, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->BOTTOM:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    const-string v1, "CENTER"

    invoke-direct {v0, v1, v6}, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->CENTER:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    .line 415
    const/4 v0, 0x5

    new-array v0, v0, [Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->LEFT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v1, v0, v2

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->RIGHT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v1, v0, v3

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->TOP:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v1, v0, v4

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->BOTTOM:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v1, v0, v5

    sget-object v1, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->CENTER:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    aput-object v1, v0, v6

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->$VALUES:[Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

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
    .line 415
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 415
    const-class v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    return-object v0
.end method

.method public static values()[Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;
    .registers 1

    .prologue
    .line 415
    sget-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->$VALUES:[Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    invoke-virtual {v0}, [Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    return-object v0
.end method
