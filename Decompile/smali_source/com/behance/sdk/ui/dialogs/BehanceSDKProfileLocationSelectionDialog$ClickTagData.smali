.class final enum Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;
.super Ljava/lang/Enum;
.source "BehanceSDKProfileLocationSelectionDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ClickTagData"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

.field public static final enum SHOW_CITIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

.field public static final enum SHOW_COUNTRIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

.field public static final enum SHOW_STATES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 658
    new-instance v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    const-string v1, "SHOW_COUNTRIES_VIEW"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_COUNTRIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    new-instance v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    const-string v1, "SHOW_STATES_VIEW"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_STATES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    new-instance v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    const-string v1, "SHOW_CITIES_VIEW"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_CITIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    .line 657
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    sget-object v1, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_COUNTRIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_STATES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->SHOW_CITIES_VIEW:Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    aput-object v1, v0, v4

    sput-object v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->$VALUES:[Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

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
    .line 657
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 657
    const-class v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;
    .registers 1

    .prologue
    .line 657
    sget-object v0, Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->$VALUES:[Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    invoke-virtual {v0}, [Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/ui/dialogs/BehanceSDKProfileLocationSelectionDialog$ClickTagData;

    return-object v0
.end method
