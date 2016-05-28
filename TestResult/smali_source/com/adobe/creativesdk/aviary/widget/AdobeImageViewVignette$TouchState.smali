.class final enum Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;
.super Ljava/lang/Enum;
.source "AdobeImageViewVignette.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "TouchState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

.field public static final enum Center:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

.field public static final enum None:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

.field public static final enum Scale:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 486
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    const-string v1, "None"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->None:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    .line 487
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    const-string v1, "Center"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->Center:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    .line 488
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    const-string v1, "Scale"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->Scale:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    .line 485
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->None:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->Center:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->Scale:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

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
    .line 485
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 485
    const-class v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;
    .registers 1

    .prologue
    .line 485
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    return-object v0
.end method
