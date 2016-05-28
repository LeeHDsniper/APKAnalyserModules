.class Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;
.super Lit/sephiroth/android/library/picasso/RequestHandler;
.source "ContactsPhotoRequestHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler$ContactPhotoStreamIcs;
    }
.end annotation


# static fields
.field private static final matcher:Landroid/content/UriMatcher;


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    .line 48
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->matcher:Landroid/content/UriMatcher;

    .line 49
    sget-object v0, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->matcher:Landroid/content/UriMatcher;

    const-string v1, "com.android.contacts"

    const-string v2, "contacts/lookup/*/#"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 50
    sget-object v0, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->matcher:Landroid/content/UriMatcher;

    const-string v1, "com.android.contacts"

    const-string v2, "contacts/lookup/*"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 51
    sget-object v0, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->matcher:Landroid/content/UriMatcher;

    const-string v1, "com.android.contacts"

    const-string v2, "contacts/#/photo"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 52
    sget-object v0, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->matcher:Landroid/content/UriMatcher;

    const-string v1, "com.android.contacts"

    const-string v2, "contacts/#"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 53
    sget-object v0, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->matcher:Landroid/content/UriMatcher;

    const-string v1, "com.android.contacts"

    const-string v2, "display_photo/#"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 54
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-direct {p0}, Lit/sephiroth/android/library/picasso/RequestHandler;-><init>()V

    .line 59
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->context:Landroid/content/Context;

    .line 60
    return-void
.end method

.method private getInputStream(Lit/sephiroth/android/library/picasso/Request;)Ljava/io/InputStream;
    .registers 7
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 76
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    .line 77
    .local v1, "uri":Landroid/net/Uri;
    sget-object v2, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->matcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    packed-switch v2, :pswitch_data_48

    .line 94
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid uri: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 79
    :pswitch_2a
    invoke-static {v0, v1}, Landroid/provider/ContactsContract$Contacts;->lookupContact(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v1

    .line 80
    if-nez v1, :cond_32

    .line 81
    const/4 v2, 0x0

    .line 92
    :goto_31
    return-object v2

    .line 85
    :cond_32
    :pswitch_32
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-ge v2, v3, :cond_3d

    .line 86
    invoke-static {v0, v1}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_31

    .line 88
    :cond_3d
    invoke-static {v0, v1}, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler$ContactPhotoStreamIcs;->get(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_31

    .line 92
    :pswitch_42
    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_31

    .line 77
    nop

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_2a
        :pswitch_42
        :pswitch_32
        :pswitch_42
    .end packed-switch
.end method


# virtual methods
.method public canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
    .registers 5
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 63
    iget-object v0, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    .line 64
    .local v0, "uri":Landroid/net/Uri;
    const-string v1, "content"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 65
    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    sget-object v1, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->matcher:Landroid/content/UriMatcher;

    iget-object v2, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    .line 66
    invoke-virtual {v1, v2}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2b

    const/4 v1, 0x1

    :goto_2a
    return v1

    :cond_2b
    const/4 v1, 0x0

    goto :goto_2a
.end method

.method public load(Lit/sephiroth/android/library/picasso/Request;I)Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    .registers 6
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .param p2, "networkPolicy"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;->getInputStream(Lit/sephiroth/android/library/picasso/Request;)Ljava/io/InputStream;

    move-result-object v0

    .line 71
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_e

    new-instance v1, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    sget-object v2, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-direct {v1, v0, v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V

    :goto_d
    return-object v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method
