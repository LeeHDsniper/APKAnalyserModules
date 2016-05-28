.class public Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "MessagePromoDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field mBottomBar:Landroid/view/View;

.field mButtonNo:Landroid/widget/Button;

.field mButtonYes:Landroid/widget/Button;

.field private mContentIdentifier:Ljava/lang/String;

.field mDescription:Landroid/widget/TextView;

.field mHeaderImage:Landroid/widget/ImageView;

.field private mMessageContentId:J

.field private mMessageId:J

.field mTextContainer:Landroid/view/View;

.field mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 274
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;II)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->displayMessage(II)V

    return-void
.end method

.method private displayMessage(II)V
    .registers 29
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 111
    const-string v22, "MessageFragment"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "dialog size: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "x"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    .line 115
    .local v8, "extras":Landroid/os/Bundle;
    const-string v22, "header_file"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 117
    .local v9, "filename":Ljava/lang/String;
    const-string v22, "message_id"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mMessageId:J

    .line 118
    const-string v22, "message_content_id"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mMessageContentId:J

    .line 119
    const-string v22, "uri"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mContentIdentifier:Ljava/lang/String;

    .line 121
    const-string v22, "message_bitmap_width"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 122
    .local v6, "bitmapWidth":I
    const-string v22, "message_bitmap_height"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 123
    .local v5, "bitmapHeight":I
    const-string v22, "android.intent.extra.TITLE"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 124
    .local v13, "messageTitle":Ljava/lang/String;
    const-string v22, "android.intent.extra.TEXT"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 125
    .local v12, "messageText":Ljava/lang/String;
    const-string v22, "dismiss_button"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 126
    .local v7, "dismissButtonText":Ljava/lang/String;
    const-string v22, "action_button"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 127
    .local v4, "actionButtonText":Ljava/lang/String;
    const-string v22, "show_new_banner"

    const/16 v23, 0x1

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-virtual {v8, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v21

    .line 129
    .local v21, "showNewBanner":Z
    const-string v22, "MessageFragment"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "title: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    const-string v22, "MessageFragment"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "text: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    const-string v22, "MessageFragment"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "dismissButtonText: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    const-string v22, "MessageFragment"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "actionButtonText: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v14

    .line 136
    .local v14, "metrics":Landroid/util/DisplayMetrics;
    move/from16 v20, p1

    .line 137
    .local v20, "screenWidth":I
    iget v0, v14, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v22, v0

    div-int/lit8 v17, v22, 0x2

    .line 148
    .local v17, "screenHeight":I
    new-instance v15, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v15}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 149
    .local v15, "options":Landroid/graphics/BitmapFactory$Options;
    const/16 v22, 0x1

    move/from16 v0, v22

    iput-boolean v0, v15, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 150
    iget v0, v14, Landroid/util/DisplayMetrics;->densityDpi:I

    move/from16 v22, v0

    move/from16 v0, v22

    iput v0, v15, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    .line 151
    const/16 v22, 0xf0

    move/from16 v0, v22

    iput v0, v15, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    .line 153
    int-to-double v0, v6

    move-wide/from16 v22, v0

    int-to-double v0, v5

    move-wide/from16 v24, v0

    div-double v18, v22, v24

    .line 155
    .local v18, "ratio":D
    move/from16 v0, v20

    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 156
    .local v11, "finalWidth":I
    int-to-double v0, v11

    move-wide/from16 v22, v0

    div-double v22, v22, v18

    move-wide/from16 v0, v22

    double-to-int v10, v0

    .line 158
    .local v10, "finalHeight":I
    move/from16 v0, v20

    if-le v11, v0, :cond_149

    .line 159
    move/from16 v11, v20

    .line 162
    :cond_149
    move/from16 v0, v17

    if-le v10, v0, :cond_14f

    .line 163
    move/from16 v10, v17

    .line 166
    :cond_14f
    const-string v22, "MessageFragment"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "final bitmap size: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "x"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mHeaderImage:Landroid/widget/ImageView;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v16

    .line 169
    .local v16, "params":Landroid/view/ViewGroup$LayoutParams;
    move-object/from16 v0, v16

    iput v11, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 170
    move-object/from16 v0, v16

    iput v10, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 171
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mHeaderImage:Landroid/widget/ImageView;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Lit/sephiroth/android/library/picasso/Picasso;->with(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v22

    new-instance v23, Ljava/io/File;

    move-object/from16 v0, v23

    invoke-direct {v0, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 174
    invoke-virtual/range {v22 .. v23}, Lit/sephiroth/android/library/picasso/Picasso;->load(Ljava/io/File;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v22

    .line 175
    invoke-virtual/range {v22 .. v22}, Lit/sephiroth/android/library/picasso/RequestCreator;->skipMemoryCache()Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v22

    .line 176
    move-object/from16 v0, v22

    invoke-virtual {v0, v11, v10}, Lit/sephiroth/android/library/picasso/RequestCreator;->resize(II)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v22

    .line 177
    invoke-virtual/range {v22 .. v22}, Lit/sephiroth/android/library/picasso/RequestCreator;->centerCrop()Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v22

    .line 178
    invoke-virtual/range {v22 .. v22}, Lit/sephiroth/android/library/picasso/RequestCreator;->noFade()Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v22

    sget-object v23, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 179
    invoke-virtual/range {v22 .. v23}, Lit/sephiroth/android/library/picasso/RequestCreator;->config(Landroid/graphics/Bitmap$Config;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mHeaderImage:Landroid/widget/ImageView;

    move-object/from16 v23, v0

    .line 180
    invoke-virtual/range {v22 .. v23}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;)V

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mTitle:Landroid/widget/TextView;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mDescription:Landroid/widget/TextView;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mDescription:Landroid/widget/TextView;

    move-object/from16 v22, v0

    const/16 v23, 0xf

    invoke-static/range {v22 .. v23}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    .line 186
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mButtonNo:Landroid/widget/Button;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 188
    if-eqz v4, :cond_22b

    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mButtonYes:Landroid/widget/Button;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 194
    :goto_201
    if-nez v21, :cond_203

    .line 198
    :cond_203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mButtonYes:Landroid/widget/Button;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mButtonNo:Landroid/widget/Button;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mMessageContentId:J

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v22

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->flagMessageAsRead(J)V

    .line 201
    return-void

    .line 191
    :cond_22b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mButtonYes:Landroid/widget/Button;

    move-object/from16 v22, v0

    const/16 v23, 0x8

    invoke-virtual/range {v22 .. v23}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_201
.end method

.method private flagMessageAsRead(J)V
    .registers 8
    .param p1, "messageContentId"    # J

    .prologue
    const/4 v4, 0x0

    .line 205
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 207
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "message/content/id/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/markasread/1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 205
    invoke-virtual {v0, v1, v2, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 210
    return-void
.end method

.method private onOkClicked()V
    .registers 21

    .prologue
    .line 225
    new-instance v18, Landroid/os/Bundle;

    invoke-direct/range {v18 .. v18}, Landroid/os/Bundle;-><init>()V

    .line 226
    .local v18, "result":Landroid/os/Bundle;
    const/16 v19, 0x0

    .line 227
    .local v19, "type":Ljava/lang/String;
    const-wide/16 v16, -0x1

    .line 229
    .local v16, "packId":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mContentIdentifier:Ljava/lang/String;

    if-eqz v2, :cond_61

    .line 230
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 231
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pack/identifier/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mContentIdentifier:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "pack_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "pack_type"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 230
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 237
    .local v11, "cursor":Landroid/database/Cursor;
    if-eqz v11, :cond_61

    .line 239
    :try_start_4c
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 240
    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v14

    .line 241
    .local v14, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v16

    .line 242
    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;
    :try_end_5d
    .catchall {:try_start_4c .. :try_end_5d} :catchall_b1

    move-result-object v19

    .line 245
    .end local v14    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    :cond_5e
    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 250
    .end local v11    # "cursor":Landroid/database/Cursor;
    :cond_61
    if-eqz v19, :cond_82

    .line 251
    const/4 v13, 0x0

    .line 252
    .local v13, "filter":Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    invoke-static/range {v19 .. v19}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->fromString(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v15

    .line 254
    .local v15, "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    if-eqz v15, :cond_75

    .line 255
    sget-object v2, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$2;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType:[I

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v4

    aget v2, v2, v4

    packed-switch v2, :pswitch_data_c2

    .line 278
    :cond_75
    :goto_75
    if-eqz v13, :cond_82

    .line 279
    const-string v2, "extra-in-quick-tool"

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .end local v13    # "filter":Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .end local v15    # "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    :cond_82
    new-instance v12, Landroid/os/Bundle;

    invoke-direct {v12}, Landroid/os/Bundle;-><init>()V

    .line 284
    .local v12, "extras":Landroid/os/Bundle;
    const-string v2, "quick-packId"

    move-wide/from16 v0, v16

    invoke-virtual {v12, v2, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 285
    const-string v2, "extra-in-quick-tool-options"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v12}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 287
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;

    const/4 v4, -0x1

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mMessageId:J

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mMessageContentId:J

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mContentIdentifier:Ljava/lang/String;

    move-object/from16 v5, v18

    invoke-direct/range {v3 .. v10}, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;-><init>(ILandroid/os/Bundle;JJLjava/lang/String;)V

    .line 290
    .local v3, "event":Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v2

    invoke-virtual {v2, v3}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 291
    return-void

    .line 245
    .end local v3    # "event":Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;
    .end local v12    # "extras":Landroid/os/Bundle;
    .restart local v11    # "cursor":Landroid/database/Cursor;
    :catchall_b1
    move-exception v2

    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v2

    .line 257
    .end local v11    # "cursor":Landroid/database/Cursor;
    .restart local v13    # "filter":Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .restart local v15    # "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    :pswitch_b6
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->EFFECTS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 258
    goto :goto_75

    .line 261
    :pswitch_b9
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FRAMES:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 262
    goto :goto_75

    .line 265
    :pswitch_bc
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->STICKERS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 266
    goto :goto_75

    .line 269
    :pswitch_bf
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->OVERLAYS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 270
    goto :goto_75

    .line 255
    :pswitch_data_c2
    .packed-switch 0x1
        :pswitch_b6
        :pswitch_b9
        :pswitch_bc
        :pswitch_bf
    .end packed-switch
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 95
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 97
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment$1;-><init>(Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 107
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 81
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 82
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 214
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 216
    .local v0, "id":I
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    if-ne v0, v1, :cond_f

    .line 217
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->onOkClicked()V

    .line 218
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->dismiss()V

    .line 222
    :goto_e
    return-void

    .line 220
    :cond_f
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->dismiss()V

    goto :goto_e
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 56
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 57
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->setStyle(II)V

    .line 58
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 63
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_promo_message_dialog:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onResume()V
    .registers 1

    .prologue
    .line 86
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 91
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 68
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 70
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mButtonNo:Landroid/widget/Button;

    .line 71
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mButtonYes:Landroid/widget/Button;

    .line 72
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->title:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mTitle:Landroid/widget/TextView;

    .line 73
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->text:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mDescription:Landroid/widget/TextView;

    .line 74
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mHeaderImage:Landroid/widget/ImageView;

    .line 75
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->text_container:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mTextContainer:Landroid/view/View;

    .line 76
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->layout01:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->mBottomBar:Landroid/view/View;

    .line 77
    return-void
.end method
