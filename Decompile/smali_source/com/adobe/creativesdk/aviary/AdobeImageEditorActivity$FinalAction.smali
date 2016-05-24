.class public final enum Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;
.super Ljava/lang/Enum;
.source "AdobeImageEditorActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FinalAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

.field public static final enum ASK:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

.field public static final enum CLOSE:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 380
    new-instance v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    const-string v1, "ASK"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;->ASK:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    new-instance v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    const-string v1, "CLOSE"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;->CLOSE:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    .line 379
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;->ASK:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;->CLOSE:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;->$VALUES:[Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

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
    .line 379
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 379
    const-class v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;
    .registers 1

    .prologue
    .line 379
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;->$VALUES:[Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    return-object v0
.end method
